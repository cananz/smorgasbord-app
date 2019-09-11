class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :current_user

  def current_user
    if @current_user
      @current_user
    else
      @current_user = User.find_by(username: session[:username])
    end
  end

  def require_login
    redirect_to sessions_path unless !!current_user
  end
end
