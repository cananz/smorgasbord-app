class RecipesController < ApplicationController
  def index
    # TODO: pass @user params from user show page & filter recipes (model method?)
    @user = User.find(params[:user])
    @recipes = Recipe.user_filtered(@user)
    # @recipes = Recipe.all
    # @user = User.find(params[:user])
  end

  def show
    @recipe = Recipe.find(params[:id])
  end

end
