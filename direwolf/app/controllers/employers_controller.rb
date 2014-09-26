class EmployersController < ApplicationController
  before_action :set_employer, only: [:show, :edit, :update, :destroy]

  include EmployersHelper

  # GET /employers
  # GET /employers.json
  def index
    employer_id = get_employer_id
    @employer = Employer.find(employer_id)
    @jobs = Job.where( employer_id: employer_id )
  end

  # GET /employers/1
  # GET /employers/1.json
  def show
  end

  # GET /employers/new
  def new
    @employer = Employer.new
    @error = flash[:error_message]
  end

  # GET /employers/1/edit
  def edit
    @employer = Employer.find params[:id]
  end

  # POST /employers
  # POST /employers.json
  def create
    @employer = Employer.new(employer_params)
    @employer.user_id = get_user_id
    @employer.pending = true

    if @employer.save
      redirect_to root_path
    else
      flash[:error_message] = "Employer creation Unsuccessful"
      redirect_to new_employer_path
    end
  end

  def accept
    @employer = Employer.find params[:id]
    @employer.pending = false

    if @employer.save
      redirect_to root_path
    else
      flash[:error_message] = "Employer Update Unsuccessful"
      redirect_to root_path
    end
  end

  # PATCH/PUT /employers/1
  # PATCH/PUT /employers/1.json
  def update
    respond_to do |format|
      if @employer.update(employer_params)
        format.html { redirect_to root_path, notice: 'Employer was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @employer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /employers/1
  # DELETE /employers/1.json
  def destroy
    @employer.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
    redirect_to root_path
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_employer
      @employer = Employer.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def employer_params
      params.require(:employer).permit(:name, :email, :company_name)
    end
end
