class Recipe < ActiveRecord::Base
  has_attached_file :photograph,
                    styles: { medium: '300x300>', thumb: '100x100>' },
                    default_url: '/images/:style/sem_foto.gif'

  validates_attachment :photograph, content_type: {
    content_type: ['image/jpg', 'image/jpeg', 'image/png', 'image/gif']
  }
  validates :recipe_name, :kitchen, :food_type, :food_preference, :ingredients,
            :step_by_step, presence: true

  belongs_to :kitchen
end
