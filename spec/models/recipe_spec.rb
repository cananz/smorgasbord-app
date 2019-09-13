require 'rails_helper'

RSpec.describe Recipe, type: :model do
  chic_breast = Ingredient.find_or_create_by(name: "Boneless skinless chicken breast", category: "Meat")
  pasta = Ingredient.find_or_create_by(name: "Pasta", category: "Misc.")
  tomatoes = Ingredient.find_or_create_by(name: "Tomatoes", category: "Produce")

  tony = User.create(
    first_name: "Tony",
    last_name: "Bennett",
    username: "tonybennett",
    password: "thecoachnotthesinger"
  )

  UserIngredient.find_or_create_by(user: tony, ingredient: chic_breast, relationship: "in_kitchen")
  UserIngredient.find_or_create_by(user: tony, ingredient: pasta, relationship: "in_kitchen")
  UserIngredient.find_or_create_by(user: tony, ingredient: tomatoes, relationship: "restricted")

  describe "when " do

  end
end
