class JobsController < ApplicationController

  include EmployersHelper
  def index
    @jobs = Job.all
  end

  def new
    @job = Job.new
  end

  def edit
    if user_is :employer
      if employer_owns params[:id]
        @job = Job.find params[:id]
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
      @job.category_id = 1
      @job.save
    end
    redirect_to employers_path
  end

  def show
    if Job.exists? params[:id]
      @job = Job.find params[:id]
      if Category.exists? @job.category_id
        @category = Category.find(@job.category_id).name
      end
      @employer = Employer.find(@job.employer_id).name
    else
      permission_denied #"Job Does Not Exist"
    end
  end

  def destroy
    if user_is :employer
      if employer_owns params[:id]
        @job = Job.find params[:id]
        flash[:error_message] = "Unable to delete" unless @job.delete
      end
    end
    redirect_to employers_path
  end

  def update
    if user_is :employer
      if employer_owns params[:id]
        @job = Job.find params[:id]
        flash[:error_message] = "Unable to update" unless @job.update(job_params)
      end
    end
    redirect_to employers_path
  end

  def get_tags_as_json
    @existing_tags = ActsAsTaggableOn::Tag.all
    render json: @existing_tags
  end

  private
  def job_params
    params.require(:job).permit(:title)
  end

end

