class CreateRestrictions < ActiveRecord::Migration[6.0]
  def change
    create_table :restrictions do |t|
      t.integer :user_id
      t.integer :ingredient_id

      t.timestamps
    end
  end
end
