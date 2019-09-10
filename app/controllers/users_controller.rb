class UsersController < ApplicationController
  def new
  end

  def create
    # create new user from form
    # set session user to this new user
    # redirect to show page
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    kitchen = selected(user_params[:ingredient_ids])
    @user.ingredients = Ingredient.find(kitchen)
    redirect_to user_path(@user)
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
