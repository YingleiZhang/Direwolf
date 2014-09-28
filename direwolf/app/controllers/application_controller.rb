class ApplicationController < ActionController::Base

  layout :user_layout

  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  helper_method :current_user

  helper_method :permission_denied

  include UsersHelper

  def current_user
    if session[:user_id]
      if User.exists?(session[:user_id])
        @current_user = User.find(session[:user_id])
      end
    else
      @current_user = nil
    end
  end

  def permission_denied (message="You_are_not_authorized_to_view_this_page")
    redirect_to "/home/unauthorized/?message="+message
  end


  private
  def user_layout

    user_type = get_user_type

    case user_type
      when :admin
        "admin_layout"
      when :employer
        "employer_layout"
      when :seeker
        "seeker_layout"
      else
        "application"
    end

  end

end
