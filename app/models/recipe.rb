class Recipe < ApplicationRecord
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def self.user_filtered(user)
    # array of hashes to return
    final = []
    # loop over each recipe
    self.all.each do |recipe|
      unless !(recipe.ingredients & user.restricted_ings).empty?
        recipe_hash = {}
        recipe_hash[:recipe] = recipe
        # count number of recipe ingredients missing from user's kitchen
        diff = recipe.ingredients - user.ingredients
        recipe_hash[:missing] = diff.length
        final << recipe_hash
      end
    end
    # return sorted array
    final = final.sort_by { |recipe| recipe[:missing] }
  end

  def self.user_include_restrictions(user)
    # array of hashes to return
    final = []
    # loop over each recipe
    self.all.each do |recipe|
        recipe_hash = {}
        recipe_hash[:recipe] = recipe
        # count number of recipe ingredients missing from user's kitchen
        diff = recipe.ingredients - user.ingredients
        recipe_hash[:missing] = diff.length
        final << recipe_hash
    end
    # return sorted array
    final = final.sort_by { |recipe| recipe[:missing] }
    final
  end
end
