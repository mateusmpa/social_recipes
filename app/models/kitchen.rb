class Kitchen < ActiveRecord::Base
  validates :kitchen_name, presence: true
end
