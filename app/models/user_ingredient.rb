class UserIngredient < ApplicationRecord
  belongs_to :user
  belongs_to :ingredient
  validates :relationship, inclusion: {in: %w(restricted in_kitchen)}
end
