# David Zager
class SeekersController < ApplicationController
  before_action :set_seeker, only: [:show, :edit, :update, :destroy]

  include SeekersHelper
  include ActsAsTaggableOn::TagsHelper

  # GET /seekers
  # GET /seekers.json
  def index
    @seeker = Seeker.find(get_seeker_id)
    @categories = Category.all
    @job_applications = JobApplication.where( seeker_id: get_seeker_id).take(1000)
    jobs_applied_for = Job
    @recommend_jobs = Job.tagged_with(@seeker.application_list, :any => true) - @job_applications.map do |an_application|
      Job.find(an_application.job_id)
    end
    @employers = Employer.all
  end

  # GET /seekers/1
  # GET /seekers/1.json
  def show
  end

  # GET /seekers/new
  def new
    @seeker = Seeker.new
  end

  # GET /seekers/1/edit
  def edit
    @seeker = Seeker.find params[:id]
  end

  # POST /seekers
  # POST /seekers.json
  def create
    @seeker = Seeker.new(seeker_params)
    @seeker.user_id = User.find(session[:user_id]).uid
    @seeker.skill_list.add(params[:seeker][:skill_list].to_s.downcase, parse: true)

    respond_to do |format|
      if @seeker.save
        format.html { redirect_to root_path, notice: 'Seeker was successfully created.' }
        format.json { render action: 'show', status: :created, location: @seeker }
      else
        format.html { render action: 'new' }
        format.json { render json: @seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /seekers/1
  # PATCH/PUT /seekers/1.json
  def update

    @seeker.skill_list = params[:seeker][:skill_list].to_s.downcase

    respond_to do |format|
      if @seeker.update(seeker_params)
        format.html { redirect_to root_path, notice: 'Seeker was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @seeker.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /seekers/1
  # DELETE /seekers/1.json
  def destroy
    @seeker.destroy
    respond_to do |format|
      format.html { redirect_to seekers_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_seeker
      @seeker = Seeker.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def seeker_params
      params.require(:seeker).permit(:name, :email, :phone, :skills, :resume)
    end
end
