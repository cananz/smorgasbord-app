class AddColumnToUserIngredients < ActiveRecord::Migration[6.0]
  def change
    add_column :user_ingredients, :relationship, :string
  end
end
