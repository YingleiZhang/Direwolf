class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_user
  def current_user
    if session[:user_id]
      if User.exists?(session[:user_id])
        @current_user = User.find(session[:user_id])
      end
    else
      @current_user = nil
    end
  end

  def permission_denied
    redirect_to "http://giphy.com/gifs/njYrp176NQsHS/fullscreen?undefined"
    # render :file => "public/401.html", :status => :unauthorized
  end

end
