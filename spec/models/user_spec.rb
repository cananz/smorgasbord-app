require 'rails_helper'
User.destroy_all

RSpec.describe User, type: :model do
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

  describe "#kitchen" do
    it "returns an array of Ingredients user has added to their kitchen" do
      expect(tony.kitchen.to_a).to eql([chic_breast, pasta])
    end

    it "does not return restricted Ingredients" do
      expect(tony.kitchen.to_a).not_to include(tomatoes)
    end
  end

  describe "#restricted_ings" do
    it "returns an array of Ingredients user has marked as restricted" do
      expect(tony.restricted_ings.to_a).to eql([tomatoes])
    end

    it "does not return Ingredients from the kitchen" do
      expect(tony.restricted_ings.to_a).not_to include(chic_breast)
      expect(tony.restricted_ings.to_a).not_to include(pasta)
    end
  end
end
