class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]

  include AdminsHelper

  # GET /admins
  # GET /admins.json
  def index
    admins_only do
      @admin = Admin.find(get_admin_id)
      @admins = Admin.all
      @employers = Employer.all
      @seekers = Seeker.all
      @categories = Category.all
    end
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    permission_denied
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
    permission_denied "This_is_not_your_profile" unless get_admin_id == params[:id]
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)
    @admin.user_id = get_user_id

    if Admin.any?
      @admin.pending = true
    else
      @admin.pending = false
    end

    respond_to do |format|
      if @admin.save
        format.html { redirect_to root_path, notice: 'Admin was successfully created.' }
        format.json { render action: 'show', status: :created, location: @admin }
      else
        format.html { render action: 'new' }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  def accept
    admins_only do
      @admin = Admin.find params[:id]
      @admin.pending = false

      if @admin.save
        redirect_to root_path
      else
        flash[:error_message] = "Admin Update Unsuccessful"
        redirect_to root_path
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    admins_only do
      respond_to do |format|
        if @admin.update(admin_params)
          format.html { redirect_to @admin, notice: 'Admin was successfully updated.' }
          format.json { head :no_content }
        else
          format.html { render action: 'edit' }
          format.json { render json: @admin.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    admins_only do
      @admin.destroy
      respond_to do |format|
        format.html { redirect_to root_path }
        format.json { head :no_content }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :email)
    end
end
