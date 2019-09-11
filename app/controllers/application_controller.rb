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
    redirect_to home_path unless !!current_user
  end

  def selected(arr)
    arr = arr[1..arr.length]
    arr.map { |e| e.to_i }
  end
end
