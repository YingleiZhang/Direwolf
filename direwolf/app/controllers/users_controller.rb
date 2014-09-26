# David Zager
class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  attr_reader :info, :type
  # GET /users
  # GET /users.json
  def index
    #@users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  # GET /users/new
  def new
    #@user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  def initialize(id)
    if User.exists?(id)
      @info = User.find(id)
      @type = :user
      if Seeker.exists?(user_id: @info.uid)
        @info = Seeker.where(user_id: @info.uid)
        @type = :seeker
      else
        if Employer.exists?(user_id: @info.uid)
          @info = Employer.where(user_id: @info.uid)
          @type = :employer
        else
          if Admin.exists?(user_id: @info.uid)
            @info = Admin.where(user_id: @info.uid)
            @type = :admin
          else
            @info = nil
            @type = nil
          end
        end
      end
    else
      @info = nil
      @type = nil
    end
  end

  # POST /users
  # POST /users.json
  def create
    #@user = User.new(user_params)

    #respond_to do |format|
    #  if @user.save
    #    format.html { redirect_to @user, notice: 'User was successfully created.' }
    #    format.json { render action: 'show', status: :created, location: @user }
    #  else
    #    format.html { render action: 'new' }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    #respond_to do |format|
    #  if @user.update(user_params)
    #    format.html { redirect_to @user, notice: 'User was successfully updated.' }
    #    format.json { head :no_content }
    #  else
    #    format.html { render action: 'edit' }
    #    format.json { render json: @user.errors, status: :unprocessable_entity }
    #  end
    #end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    #@user.destroy
    #respond_to do |format|
    #  format.html { redirect_to users_url }
    #  format.json { head :no_content }
    #end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params[:user]
    end
end
