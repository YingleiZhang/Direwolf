class JobController < ApplicationController
  def index
    @job = Job.all
  end
  def new
    @job = Job.new
  end
  def create
    @job = Job.new(job_params)
    @user = User.find_by(session[:user_id])
    flash[:uid] = @user.uid
    @employer = Employer.find_by user_id: @user.uid
    @job.employer_id = @employer.id
    @job.category_id = 1
    @job.save!
    redirect_to root_path
  end
  private
  def job_params
    params.require(:job).permit(:title)
  end
end
