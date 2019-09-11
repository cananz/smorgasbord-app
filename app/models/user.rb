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
end
