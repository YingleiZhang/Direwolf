class HomeController < ApplicationController
  def show
  end
  def register
    if session[:user_id]
      if User.exists?(session[:user_id])
        @user = UsersController.new(session[:user_id])
      end
    end
  end
end
