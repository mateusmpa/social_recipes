class FoodType < ActiveRecord::Base
  validates :food_type_name, presence: true

  has_many :recipes
end
