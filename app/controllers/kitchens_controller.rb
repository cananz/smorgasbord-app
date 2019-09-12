class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    # overwrite current_user's Kitchen associations with form selections
    current_user.kitchens.destroy_all

    new_kitchen_params.each do |ing|
    # byebug
      current_user.kitchens << Kitchen.create(ingredient_id: ing)
    # byebug
  end
    redirect_to user_path(current_user)
  end

  def edit
    # byebug
    @kitchens = current_user.kitchens

    @user = current_user
  end

  def update

  end
end

private

def kitchen_params
  params.require(:kitchen).permit(ingredient_ids:[])
end

def new_kitchen_params
  selected(params[:kitchen][:ingredient_id])
end
