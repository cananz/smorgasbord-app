class User < ApplicationRecord
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_secure_password
  accepts_nested_attributes_for :user_ingredients
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def kitchen
    self.ingredients.merge(UserIngredient.where(relationship: "in_kitchen"))
  end

end
