class JobApplicationsController < ApplicationController
 include SeekersHelper 
  def new
    if(params[:job_id])
      @job = Job.find(params[:job_id])
      if @job
        @app = JobApplication.new
        @employer = Employer.find @job.employer_id
        @seeker_id = get_seeker_id
      else
        redirect_to ll
      end
    end
  end

  def create
      @app = JobApplication.new(job_params)
      @app.status_id = :true
      if !@app.save
        flash[:error_message] = "Unable to apply for job"
      end
      redirect_to root_path
  end

  def index
    permission_denied
  end

  def edit
  end

  def show
    @apps = JobApplication.find_by job_id: params[:id]
    if @apps
      @seeker = Seeker.find @apps.seeker_id
      @job = Job.find params[:id]
      @employer = Employer.find @job.employer_id
    end
  end

  private
  def job_params
    params[:job_application].permit(:cover_letter, :employer_id, :job_id, :seeker_id)
  end
end

