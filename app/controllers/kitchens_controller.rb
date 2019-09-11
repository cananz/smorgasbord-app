class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    # overwrite current_user's Kitchen associations with form selections
    current_user.kitchens = Ingredient.find(selected(params[:kitchen][:ingredient_id]))
    byebug
    redirect_to user_path(current_user)
  end
end

private

def kitchen_params
  params.require(:kitchen).permit(ingredient_ids:[])
end