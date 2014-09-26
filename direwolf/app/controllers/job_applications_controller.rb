class JobApplicationsController < ApplicationController
 include SeekersHelper 
 include EmployersHelper
  def new
    if(params[:job_id])
      @job = Job.find(params[:job_id])
      if @job
        @app = JobApplication.new
        @employer = Employer.find @job.employer_id
        @seeker_id = get_seeker_id
      end
    end
  end

  def create
      @app = JobApplication.new(job_params)

      job = Job.find(@app.job_id)
      tag_list = job.tag_list
      seeker = Seeker.find(@app.seeker_id)

      seeker.application_list.add(tag_list.to_s, parse: true)

      if !@app.save or !seeker.save
        flash[:error_message] = "Unable to apply for job"
      end
      redirect_to root_path
  end

  def edit
  end

  def index
    if employer_owns params[:job_id]
      @apps = JobApplication.where(job_id: params[:job_id]).take(1000)
    end
  end

  def show
    @app = JobApplication.find params[:id]
    if employer_or_seeker_owns @app
      @seeker = Seeker.find @app.seeker_id
      @employer = Employer.find @app.employer_id
      @job = Job.find @app.job_id
    else
      permission_denied
    end
  end

  def destroy
    if seeker_owns params[:id]
      app = JobApplication.find params[:id]
      app.delete
    end
  end

  def accept
    @app = JobApplication.find params[:id]
    if employer_owns @app.job_id
      @app.status_id = "accepted"
      if( @app.save )
        flash[:status] = "Success"
      else
        flash[:error_message] = "Unable to change status"
      end
    end
    redirect_to job_applications_path(job_id: @app.job_id)
  end

  def reject
    @app = JobApplication.find params[:id]
    if employer_owns @app.job_id
      @app.status_id = "rejected"
      if( @app.save )
        flash[:status] = "Success"
      else
        flash[:error_message] = "Unable to change status"
      end
    end
    redirect_to job_applications_path(job_id: @app.job_id)
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

