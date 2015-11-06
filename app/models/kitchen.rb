class Kitchen < ActiveRecord::Base
  validates :kitchen_name, presence: true

  has_many :recipes
end
