class FoodPreference < ActiveRecord::Base
  validates :food_preference_name, presence: true

  has_many :recipes
end
