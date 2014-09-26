class JobApplicationsController < ApplicationController
 include SeekersHelper 
  def new
    if(params[:job_id])
      @job = Job.find(params[:job_id])
      if @job
      @app = JobApplication.new
      @app.job_id = params[:job_id]
      @employer = Employer.find(@job.employer_id)
      @app.employer_id = @employer.id
      @app.status_id = "pending"
      end
    end
  end

  def create
      @app.seeker_id = get_seeker_id
      @app.save
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
    params[:job_application].permit(:cover_letter)
  end
end

