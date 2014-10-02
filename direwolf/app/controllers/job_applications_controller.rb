class JobApplicationsController < ApplicationController
  include SeekersHelper 
  include EmployersHelper

  def new
    seekers_only do
      if(params[:job_id])
        @job = Job.find(params[:job_id])
        if @job
          @app = JobApplication.new
          @employer = Employer.find @job.employer_id
          @seeker_id = get_seeker_id
        end
      end
    end
  end

  def create
    seekers_only do
      @app = JobApplication.new(job_params)
      @app.status_id = "Pending"
      job = Job.find(@app.job_id)
      tag_list = job.tag_list
      seeker = Seeker.find(@app.seeker_id)

      seeker.application_list.add(tag_list.to_s, parse: true)
      if JobApplication.find_by( seeker_id: @app.seeker_id, job_id: @app.job_id).nil?
        if @app.save and seeker.save
          UserMailer.application_submitted(@app).deliver
        else
          flash[:error_message] = "Unable to apply for job"
        end
      else
        flash[:error_message] = "You have already applied to that job!"
      end
      redirect_to root_path
    end
  end

  def edit
    seekers_only do
      permission_denied "You_do_not_own_this_application" unless get_seeker_id == JobApplication.find(params[:id]).seeker_id
    end
  end

  def index
    employers_only do
      if employer_owns params[:job_id]
        @apps = JobApplication.where(job_id: params[:job_id]).take(1000)
      end
    end
  end

  def show
    if JobApplication.exists? params[:id]
    @app = JobApplication.find params[:id]
    if employer_or_seeker_owns @app
      @seeker = Seeker.find @app.seeker_id
      @employer = Employer.find @app.employer_id
      @job = Job.find @app.job_id
    else
      permission_denied "You_are_not_associated_with_this_application"
    end
    else
      permission_denied "Job_Application_does_not_exist"
    end
  end

  def destroy
    seekers_only do
      if seeker_owns params[:id]
        app = JobApplication.find params[:id]
        app.delete
      end
      redirect_to root_path
    end
  end

  def accept
    employers_only do
      @app = JobApplication.find params[:id]
      if employer_owns @app.job_id
        @app.status_id = "Accepted"
        if( @app.save )
          flash[:status] = "Success"
          UserMailer.application_status(@app).deliver
        else
          flash[:error_message] = "Unable to change status"
        end
      end
      redirect_to job_applications_path(job_id: @app.job_id)
    end
  end

  def reject
    employers_only do
      @app = JobApplication.find params[:id]
      if employer_owns @app.job_id
        @app.status_id = "Rejected"
        if( @app.save )
          flash[:status] = "Success"
          UserMailer.application_status(@app).deliver
        else
          flash[:error_message] = "Unable to change status"
        end
      end
      redirect_to job_applications_path(job_id: @app.job_id)
    end
  end

  private
  def job_params
    params[:job_application].permit(:cover_letter, :employer_id, :job_id, :seeker_id)
  end

  def employer_or_seeker_owns app
    if (employer_owns(app.job_id) || seeker_owns( app.id))
      return :true
    else
      return :false
    end
  end
end

