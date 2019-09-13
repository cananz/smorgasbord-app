require 'rails_helper'
User.destroy_all

RSpec.describe Recipe, type: :model do
  chic_breast = Ingredient.find_or_create_by(name: "Boneless skinless chicken breast", category: "Meat")
  pasta = Ingredient.find_or_create_by(name: "Pasta", category: "Misc.")
  tomatoes = Ingredient.find_or_create_by(name: "Tomatoes", category: "Produce")
  parmesan = Ingredient.find_or_create_by(name: "Parmesan cheese", category: "Misc.")
  onion = Ingredient.find_or_create_by(name: "Onion", category: "Produce")
  rice = Ingredient.find_or_create_by(name: "Rice", category: "Misc.")
  bells = Ingredient.find_or_create_by(name: "Bell peppers", category: "Produce")
  corn = Ingredient.find_or_create_by(name: "Corn", category: "Produce")
  shredded = Ingredient.find_or_create_by(name: "Shredded cheddar cheese", category: "Misc.")
  c_stock = Ingredient.find_or_create_by(name: "Chicken stock", category: "Misc.")
  black_beans = Ingredient.find_or_create_by(name: "Black beans", category: "Misc.")
  salsa = Ingredient.find_or_create_by(name: "Salsa", category: "Misc.")
  garlic = Ingredient.find_or_create_by(name: "Clove garlic", category: "Misc.")
  pesto = Ingredient.find_or_create_by(name: "Pesto", category: "Misc.")
  m_jack = Ingredient.find_or_create_by(name: "Monterrey Jack cheese", category: "Misc.")
  bacon = Ingredient.find_or_create_by(name: "Bacon", category: "Meat")

  tony = User.create(
    first_name: "Tony",
    last_name: "Bennett",
    username: "tonybennett",
    password: "thecoachnotthesinger"
  )

  UserIngredient.find_or_create_by(user: tony, ingredient: chic_breast, relationship: "in_kitchen")
  UserIngredient.find_or_create_by(user: tony, ingredient: pasta, relationship: "in_kitchen")
  UserIngredient.find_or_create_by(user: tony, ingredient: tomatoes, relationship: "restricted")

  one_tray_pasta = Recipe.find_or_create_by(name: "One-Tray Pesto Pasta", url: "https://tasty.co/recipe/one-tray-pesto-pasta")
  one_tray_pasta.ingredients = [pasta, tomatoes, pesto, parmesan]

  chix_burr_bowl= Recipe.find_or_create_by(name: "Chicken Burrito Bowls", url: "https://tasty.co/recipe/meal-prep-chicken-burrito-bowls")
  chix_burr_bowl.ingredients = [chic_breast, black_beans, onion, garlic, salsa, rice]

  stuffed_peppers = Recipe.find_or_create_by(name: "Slow Cooker Stuffed Peppers", url: "https://tasty.co/recipe/slow-cooker-stuffed-peppers")
  stuffed_peppers.ingredients = [bells, rice, corn, onion, black_beans, tomatoes, salsa, shredded, c_stock]

  chicken_skillet = Recipe.find_or_create_by(name: "Monterrey Chicken Skillet", url: "https://www.budgetbytes.com/monterey-chicken-skillet/")
  chicken_skillet.ingredients = [chic_breast, pasta, m_jack, bacon]


  describe ".user_include_restrictions" do
    it "returns all recipes, regardless of user's restricted ingredients" do
      expect(Recipe.user_include_restrictions(tony).count).to eq(Recipe.all.count)
    end
  end

  describe ".user_filtered" do
    # byebug
    it "does not return recipes including any of a user's restricted ingredients" do
      expect(Recipe.user_filtered(tony).any? { |hash| hash[:recipe] == chix_burr_bowl }).to be(true)
      expect(Recipe.user_filtered(tony).any? { |hash| hash[:recipe] == chicken_skillet }).to be(true)
      expect(Recipe.user_filtered(tony).any? { |hash| hash[:recipe] == one_tray_pasta }).to be(false)
      expect(Recipe.user_filtered(tony).any? { |hash| hash[:recipe] == stuffed_peppers }).to be(false)
    end
  end
end
