FactoryGirl.define do
  factory :recipe do
    recipe_name 'Bife a Milanesa'
    kitchen
    food_type 'acompanhamento'
    food_preference 'carnes'
    amount_people 6
    cooking_time 40
    difficulty_level 'fácil'
    ingredients 'Inserindo ingredientes...'
    step_by_step 'Inserindo passo a passo...'
    photograph do
      File.open(Rails.root.join('spec', 'test_files', 'bife_a_milanesa.jpg'))
    end
  end
end
