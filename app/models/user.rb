class User < ApplicationRecord
  has_many :kitchens
  has_many :ingredients, through: :kitchens
  has_many :ingredients, through: :restrictions
  has_many :restrictions

  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  def name
    "#{self.first_name} #{self.last_name}"
  end

  def in_kitchen
    # return all Ingredients associated w user through Kitchen table
    # Kitchen.all.find_all{ || }
    ing_ids = self.kitchens.pluck(:ingredient_id)
    ing_ids.map { |id| Ingredient.where(id: id) }
  end
end
