class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
  end

  def create
    # create new user from form
    # set session user to this new user
    # redirect to show page
  end

  def show
    @user = current_user
  end

  def edit
    # @user = current_user
  end

  def update
    # @user = current_user
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
end
