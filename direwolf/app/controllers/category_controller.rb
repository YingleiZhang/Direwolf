class CategoryController < ApplicationController

  def index
    @category = Category.all
    @type = UsersController.new( session[:user_id] ).type

    if @type != :admin
      permission_denied
    else

    end
  end

end
