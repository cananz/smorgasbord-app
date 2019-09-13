class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create]

  def new
    #get new account form
    @user = User.new
  end

  def create
    #post create new account
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

  def edit_restricted
    @user = current_user
  end

  def update_restricted
    old = current_user.user_ingredients.where(relationship: "restricted")
    old.destroy_all
    add = selected(user_params[:ingredient_ids])
    add.each do |ing_id|
      UserIngredient.create(
        user: current_user,
        ingredient_id: ing_id,
        relationship: "restricted"
      )
    end
    redirect_to user_path(current_user)
  end

  def edit_kitchen
    @user = current_user
  end

  def update_kitchen
    old = current_user.user_ingredients.where(relationship: "in_kitchen")
    old.destroy_all
    add = selected(user_params[:ingredient_ids])
    #loop over ing_ids array and create user_ingredient instance for each (with self and corresponding relationship)
    add.each do |ing_id|
      UserIngredient.create(
        user: current_user,
        ingredient_id: ing_id,
        relationship: "in_kitchen"
      )
    end
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
