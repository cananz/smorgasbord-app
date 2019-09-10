class ApplicationController < ActionController::Base

  private

  def current_user
    session[:username]
  end

  def require_login
    redirect_to 'sessions#login_or_create_account' unless current_user.present?
  end
end
