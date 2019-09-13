class Ingredient < ApplicationRecord
  has_many :user_ingredients
  has_many :users, through: :user_ingredients
  has_many :recipe_ingredients
  has_many :recipes, through: :recipe_ingredients

  def self.category(cat)
    Ingredient.all.select {|ing| ing.category == cat}
  end

  def self.categories
    Ingredient.all.map {|ing| ing.category}.uniq
  end

  def self.category_sort
    sorted = {}
    #array of category names
    Ingredient.categories.each do |cat|
      #each cat name set to a key w/ value = corresponding ingredient objects
      sorted[cat] = Ingredient.category(cat)
    end
    sorted.values.flatten
  end

end
