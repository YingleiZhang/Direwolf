class CategoryController < ApplicationController

  include AdminsHelper

  def index
    admins_only do
      @category = Category.new
      @categories = Category.all
    end
  end

  def show

  end

  # GET /category/new
  def new
    admins_only do
      @category = Category.new
    end
  end

  # POST /category
  # POST /category.json
  def create
    admins_only do
      @category = Category.new(category_params)
      @category.name = params[:category][:name].to_s.camelcase

      respond_to do |format|
        if @category.save
          format.html { redirect_to category_index_path, notice: 'Category was successfully created.' }
          format.json { render action: 'index', status: :created, location: @category }
        else
          format.html { render action: 'new' }
          format.json { render json: @category.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  # DELETE /category/1
  # DELETE /category/1.json
  def destroy
    admins_only do
      @category = Category.find params[:id]
      if @category.destroy
        @notice = 'Category was removed'
      else
        @notice = "Error"
      end
      redirect_to category_index_path
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def category_params
    params.require(:category).permit(:name)
  end

end
