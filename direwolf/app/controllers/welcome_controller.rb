class WelcomeController < ApplicationController
  def index
    if session[:user_id]
      if User.exists?(session[:user_id])
        user = UsersController.new(session[:user_id])
        if(user.type)
          redirect_to "/"+user.type.to_s.pluralize(0)
        else
          redirect_to "/home/register/"
        end
      end
    end
  end
end
