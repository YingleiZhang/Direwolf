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

      job = Job.find(@app.job_id)
      tag_list = job.tag_list
      seeker = Seeker.find(@app.seeker_id)

      puts "#{seeker.name} is applying for: " + tag_list.to_s
      seeker.application_list.add(tag_list.to_s, parse: true)

      if !@app.save or !seeker.save
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

