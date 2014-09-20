class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      if User.exists?(session[:user_id])
        user_type = UsersController.new(session[:user_id])
        if(user_type.user)
          redirect_to "/home/"+user_type.user
        else
          redirect_to "/home/register/"
        end
      end
    end
  end
end
