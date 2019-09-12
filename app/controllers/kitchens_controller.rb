class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    byebug
    # overwrite current_user's Kitchen associations with form selections
    current_user.kitchens.destroy_all
    byebug
    params[:ingredient_ids].each do |ing_id|
      # byebug
      Kitchen.create(user_id: current_user.id, ingredient_id: ing_id)
      # byebug
    end
    redirect_to user_path(current_user)
  end

  def edit
    # byebug
    @kitchen = current_user.kitchens

    @user = current_user
  end

  def update

  end
end

private

def kitchen_params
  params.permit(ingredient_ids:[])
end

# def new_kitchen_params
#   selected(params[:kitchen][:ingredient_id])
# end
