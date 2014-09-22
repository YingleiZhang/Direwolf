class JobApplicationsController < ApplicationController
  def index
    permission_denied
  end
  def edit
  end
  def show
    @apps = Application.find_by job_id: params[:id]
  end
end
