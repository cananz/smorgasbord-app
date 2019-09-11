class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    @user = User.new
  end

  def create
    @user = User.new
    if @user.update(new_user_params)
      session[:username] = @user.username
      redirect_to user_path(@user)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    kitchen = selected(user_params[:ingredient_ids])
    current_user.ingredients = Ingredient.find(kitchen)
    redirect_to user_path(current_user)
  end

  private

  def selected(arr)
    arr = arr[1..arr.length]
    arr.map { |e| e.to_i }
  end

  def user_params
    params.require(:user).permit(ingredient_ids:[])
  end

  def new_user_params
    params.require(:user).permit(:first_name, :last_name, :username, :password, :password_confirmation)
  end
end
