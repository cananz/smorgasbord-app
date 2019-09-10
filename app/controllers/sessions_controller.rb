class SessionsController < ApplicationController
  def index
    # shows login or create account
  end

  def new
    # render login form
  end

  def create
    # create new session based on existing user
    @user = User.find_by(username: params[:username])
    if @user && @user.authenticate(params[:password])
      session['user'] = @user.username
      redirect_to user_path(@user)
    else
      @error = "Invalid username or password"
      render :new
    end
  end

  def destroy
    # logout by destroying session user
  end
end
