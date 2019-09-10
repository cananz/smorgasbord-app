# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

#USER
User.find_or_create_by(id: 1, first_name: "Marisa", last_name: "Canan")
User.find_or_create_by(id: 2, first_name: "Pete", last_name: "Hanner")


# RECIPES
one_tray_pasta = Recipe.find_or_create_by(name: "One-Tray Pesto Pasta", url: "https://tasty.co/recipe/one-tray-pesto-pasta")
chix_burr_bowl= Recipe.find_or_create_by(name: "Chicken Burrito Bowls", url: "https://tasty.co/recipe/meal-prep-chicken-burrito-bowls")
black_bean_chili = Recipe.find_or_create_by(name: "Black Bean Chili", url: "https://www.budgetbytes.com/weeknight-black-bean-chili/")
chicken_skillet = Recipe.find_or_create_by(name: "Monterrey Chicken Skillet", url: "https://www.budgetbytes.com/monterey-chicken-skillet/")
chickpea_curry = Recipe.find_or_create_by(name: "Curried Chickpeas with Spinach", url: "https://www.budgetbytes.com/curried-chickpeas-spinach/")
bac_parm_pasta = Recipe.find_or_create_by(name: "Bacon and Spinach Pasta with Parmesan", url: "https://www.budgetbytes.com/bacon-spinach-pasta-parmesan/")
stuffed_peppers =Recipe.find_or_create_by(name: "Slow Cooker Stuffed Peppers", url: "https://tasty.co/recipe/slow-cooker-stuffed-peppers")
pizzadilla = Recipe.find_or_create_by(name: "Pizzadilla", url: "https://www.budgetbytes.com/pizzadillas/")
turkey_burgers = Recipe.find_or_create_by(name: "Green Chile Turkey Burgers", url: "https://www.budgetbytes.com/green-chile-turkey-burgers/")
watermelon_salad = Recipe.find_or_create_by(name: "Watermelon Feta Salad", url: "https://www.delish.com/cooking/recipe-ideas/recipes/a5739/watermelon-salad-feta-mint-recipe/")


# INGREDIENTS

chic_breast = Ingredient.find_or_create_by(name: "Boneless skinless chicken breast", category: "Meat")
pasta = Ingredient.find_or_create_by(name: "Pasta", category: "Misc.")
tomatoes = Ingredient.find_or_create_by(name: "Tomatoes", category: "Produce")
pesto = Ingredient.find_or_create_by(name: "Pesto" category: "Misc.")
parmesan = Ingredient.find_or_create_by(name: "Parmesan cheese" category: "Misc.")
onion = Ingredient.find_or_create_by(name: "Onion", category: "Produce")
ground_turkey = Ingredient.find_or_create_by(name: "Ground turkey", category: "Meat")
black_beans = Ingredient.find_or_create_by(name: "Black beans", category: "Misc.")
m_jack = Ingredient.find_or_create_by(name: "Monterrey Jack cheese", category: "Misc.")
garlic = Ingredient.find_or_create_by(name: "Clove garlic", category: "Misc.")
salsa = Ingredient.find_or_create_by(name: "Salsa", category: "Misc.")
bacon = Ingredient.find_or_create_by(name: "Bacon", category: "Meat")
rice = Ingredient.find_or_create_by(name: "Rice", category: "Misc.")
ginger = Ingredient.find_or_create_by(name: "Ginger", category: "Misc.")
chickpeas = Ingredient.find_or_create_by(name: "Chickpeas", category: "Misc.")
curry_powder = Ingredient.find_or_create_by(name: "Curry powder", category: "Misc.")
spinach = Ingredient.find_or_create_by(name: "Spinach", category: "Produce")
olives = Ingredient.find_or_create_by(name: "Olives", category: "Produce")
mushrooms = Ingredient.find_or_create_by(name: "Mushrooms", category: "Produce")
bells = Ingredient.find_or_create_by(name: "Bell peppers", category: "Produce")
green_pepper = Ingredient.find_or_create_by(name: "Green peppers", category: "Produce")
tom_sauce = Ingredient.find_or_create_by(name: "Tomato sauce", category: "Misc.")
corn = Ingredient.find_or_create_by(name: "Corn", category: "Produce")
shredded = Ingredient.find_or_create_by(name: "Shredded cheddar cheese", category: "Misc.")
c_stock = Ingredient.find_or_create_by(name: "Chicken stock", category: "Misc.")
tortilla = Ingredient.find_or_create_by(name: "Tortillas", category: "Misc.")
avocado = Ingredient.find_or_create_by(name: "Avocado", category: "Produce")
pepperoni = Ingredient.find_or_create_by(name: "Pepperoni", category: "Meat")
mozzarella = Ingredient.find_or_create_by(name: "Mozzarella cheese", category: "Misc.")
feta = Ingredient.find_or_create_by(name: "Feta cheese", category: "Misc.")
watermelon = Ingredient.find_or_create_by(name: "Watermelon", category: "Produce")
cucumber = Ingredient.find_or_create_by(name: "Cucumber", category: "Produce")
red_onion = Ingredient.find_or_create_by(name: "Red onion", category: "Produce")
mint = Ingredient.find_or_create_by(name: "Mint", category: "Misc.")

# ADD INGREDIENTS
watermelon_salad.ingredients = [watermelon, cucumber, feta, red_onion, mint]
stuffed_peppers.ingredients = [bells, rice, corn, onion, black_beans, tomatoes, salsa, shredded, c_stock]
chix_burr_bowl.ingredients = [chic_breast, black_beans, onion, garlic, salsa, rice]
one_tray_pasta.ingredients = [pasta, tomatoes, pesto, parmesan]
black_bean_chili.ingredients = [onion, ground_turkey, black_beans, tomatoes, garlic, tom_sauce, c_stock]
chicken_skillet.ingredients = [chic_breast, tomatoes, pasta, m_jack, bacon]
chickpea_curry.ingredients = [chickpeas, onion, garlic, ginger, curry_powder, spinach, tom_sauce, c_stock]
bac_parm_pasta.ingredients = [onion, pasta, spinach, parmesan, bacon, c_stock]
pizzadilla.ingredients = [tortilla, mozzarella, bells, red_onion, tom_sauce, pepperoni, olives, mushrooms]
turkey_burgers.ingredients = [ground_turkey, green_pepper, onion, m_jack, tomatoes, avocado]
