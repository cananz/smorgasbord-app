class User < ApplicationRecord
  has_many :user_ingredients
  has_many :ingredients, through: :user_ingredients
  has_secure_password
  validates :username, presence: true, uniqueness: {case_sensitive: false}

  def name
    "#{self.first_name} #{self.last_name}"
  end
end
