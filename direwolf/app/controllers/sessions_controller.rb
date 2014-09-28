# David Zager
class SessionsController < ApplicationController
  def create
    user = User.login(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_path
  end

  def destroy
    User.logout(session[:user_id])
    session[:user_id] = nil
    webapp_url = "http://localhost:9292/"
    #redirect_to "https://www.google.com/accounts/Logout"
    redirect_to "https://www.google.com/accounts/Logout?continue=https://appengine.google.com/_ah/logout?continue=" + webapp_url
    #redirect_to root_path
  end
end
