class JobApplicationsController < ApplicationController

  def index
    permission_denied
  end

  def edit
  end

  def show
    @apps = Application.find_by job_id: params[:id]
    redirect_to job_application_show_path
  end

end
