FactoryGirl.define do
  factory :recipe do
    recipe_name 'MyString'
    kitchen 'MyString'
    food_type 'MyString'
    food_preference 'MyString'
    amount_people 1
    cooking_time 1
    difficulty_level 'MyString'
    ingredients 'MyText'
    step_by_step 'MyText'
  end
end
