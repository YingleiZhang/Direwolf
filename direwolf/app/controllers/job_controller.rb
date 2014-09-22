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
    # add tags
    flash[:uid] = @user.uid
    @employer = Employer.find_by user_id: @user.uid
    @job.employer_id = @employer.id
    @job.category_id = 1
    @job.save!
    redirect_to root_path
  end
  def show
    @job = Job.find params[:id]
    if @job
      if Category.exists? @job.category_id
        @category = Category.find(@job.category_id).name
      end
      @employer = Employer.find(@job.employer_id).name
    end
  end

  private
  def job_params
    params.require(:job).permit(:title)
  end
end

