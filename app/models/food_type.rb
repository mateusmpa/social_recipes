class FoodType < ActiveRecord::Base
  validates :food_type_name, presence: true
end
