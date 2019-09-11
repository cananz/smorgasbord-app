class RenameUserIngredientsToKitchen < ActiveRecord::Migration[6.0]
  def change
    rename_table :user_ingredients, :kitchens
  end
end
