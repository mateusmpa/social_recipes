FactoryGirl.define do
  factory :recipe do
    recipe_name 'Bife a Milanesa'
    kitchen
    food_type
    food_preference
    amount_people 6
    cooking_time 40
    difficulty_level 'fácil'
    ingredients 'Inserindo ingredientes...'
    step_by_step 'Inserindo passo a passo...'
  end
end
