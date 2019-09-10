class User < ApplicationRecord
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  accepts_nested_attributes_for :ingredients

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
