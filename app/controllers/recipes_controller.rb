class RecipesController < ApplicationController
  def index
    # byebug
    if params[:restrictions] == "false"
      @recipes = Recipe.user_include_restrictions(current_user)
    else
      @recipes = Recipe.user_filtered(current_user)
    end
  end

  def show
    @recipe = Recipe.find(params[:id])
  end
end
