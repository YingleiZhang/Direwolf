class JobsController < ApplicationController

  include UsersHelper
  include EmployersHelper
  include ActsAsTaggableOn::TagsHelper

  def index
    if params[:search]
      @jobs = Job.search(params[:search])
    else
      @jobs = Job.all
    end
    # @user_type = get_user_type
    #
    # if user_is :employer
    #   @jobs = Job.where( employer_id: get_employer_id )
    #   return
    # else
    #   @jobs = Job.all
    # end
  end

  def new
    employers_only do
      @job = Job.new
      @categories = Category.all
    end
  end

  def edit
    employers_only do
      if employer_owns params[:id]
        @job = Job.find params[:id]
        @ustime = @job.ustime
        @categories = Category.all
      end
      permission_denied "You_do_not_own_that_job_posting" unless @job
    end
  end

  def create
    employers_only do
      job_info = job_params
      job_info[:expires_at] = Job.utctime(job_info[:expires_at])
      @job = Job.new(job_info)
      # add tags
      @job.tag_list.add(params[:job][:tag_list].to_s.downcase, parse: true)
      @job.employer_id = get_employer_id
      @job.category_id = params[:job][:category_id]
      flash[:error_message] = @job.errors.message unless @job.save
      redirect_to jobs_path
    end
  end

  def show
    if Job.exists? params[:id]
      @job = Job.find params[:id]
      if Category.exists? @job.category_id
        @category = Category.find(@job.category_id).name
      end
      @employer = Employer.find(@job.employer_id)
    else
      permission_denied "Job_Does_Not_Exist"
    end
  end

  def destroy
    employers_only do
      if employer_owns params[:id]
        @job = Job.find params[:id]
        JobApplication.where(job_id: params[:id]).each do |app|
          app.delete
        end
        flash[:error_message] = "Unable to delete" unless @job.delete
      end
      redirect_to root_path
    end
  end

  def update
    employers_only do
      if employer_owns params[:id]
        @job = Job.find params[:id]
        @job.tag_list = params[:job][:tag_list].to_s.downcase
        job_info = job_params
        job_info[:expires_at] = Job.utctime(params[:job][:ustime])
        flash[:error_message] = "Unable to update" unless @job.update(job_info)
      end
      redirect_to root_path
    end
  end

  def get_tags_as_json
    @existing_tags = ActsAsTaggableOn::Tag.all
    render json: @existing_tags
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_job
    @job = Admin.find(params[:id])
  end

  def job_params
    params.require(:job).permit(:title, :search, :description, :expires_at)
  end

end

