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
    @job = Job.new
    @categories = Category.all
  end

  def edit
    if user_is :employer
      if employer_owns params[:id]
        @job = Job.find params[:id]
        @categories = Category.all
      end
    end
    permission_denied unless @job
  end

  def create
    if user_is :employer
      @job = Job.new(job_params)
      # add tags
      @job.tag_list.add(params[:job][:tag_list].to_s.downcase, parse: true)
      @job.employer_id = get_employer_id
      @job.category_id = params[:job][:category_id]
      flash[:error_message] = "Unable to create" unless @job.save
    end
    redirect_to jobs_path
  end

  def show
    if Job.exists? params[:id]
      @job = Job.find params[:id]
      if Category.exists? @job.category_id
        @category = Category.find(@job.category_id).name
      end
      @employer = Employer.find(@job.employer_id)
    else
      permission_denied #"Job Does Not Exist"
    end
  end

  def destroy
    if user_is :employer
      if employer_owns params[:id]
        @job = Job.find params[:id]
        JobApplication.where(job_id: params[:id]).each do |app|
          app.delete
        end
        flash[:error_message] = "Unable to delete" unless @job.delete
      end
    end
    redirect_to root_path
  end

  def update
    if user_is :employer
      if employer_owns params[:id]
        @job = Job.find params[:id]
        @job.tag_list = params[:job][:tag_list].to_s.downcase
        flash[:error_message] = "Unable to update" unless @job.update(job_params)
      end
    end
    redirect_to root_path
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

