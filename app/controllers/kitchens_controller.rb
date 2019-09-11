class KitchensController < ApplicationController
  def new
    @kitchen = Kitchen.new
  end

  def create
    # overwrite current_user's Kitchen associations with form selections
  end
end

private

def kitchen_params
  params.require(:kitchen).permit(ingredient_ids:[])
end