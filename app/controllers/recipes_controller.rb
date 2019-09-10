class RecipesController < ApplicationController
  def index
    @recipes = Recipe.user_filtered(current_user)
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
