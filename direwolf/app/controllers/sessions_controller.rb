class SessionsController < ApplicationController
  def create
    user = User.login(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    User.logout(session[:user_id])
    session[:user_id] = nil
    redirect_to root_path
  end
end
