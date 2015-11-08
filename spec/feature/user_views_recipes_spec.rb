require 'rails_helper'

feature 'User views all recipes' do
  before(:each) do
    @recipe = create(:recipe,
                     photograph: File.open(Rails.root
                      .join('spec', 'test_files', 'bife_a_milanesa.jpg')))
    @recipe_1 = create(:recipe, recipe_name: 'Lasanha')
    @recipe_2 = create(:recipe, recipe_name: 'Frango a passarinho',
                                difficulty_level: 'difícil')
    visit recipes_path
  end

  scenario 'successfully' do
    expect(page).to have_content @recipe.recipe_name
    expect(page).to have_content @recipe.food_preference.food_preference_name
    expect(page).to have_content @recipe.food_type.food_type_name
    expect(page).to have_content @recipe.kitchen.kitchen_name
    expect(page).to have_content @recipe.difficulty_level

    expect(page).to have_content @recipe_1.recipe_name
    expect(page).to have_content @recipe_1.food_preference.food_preference_name
    expect(page).to have_content @recipe_1.food_type.food_type_name
    expect(page).to have_content @recipe_1.kitchen.kitchen_name
    expect(page).to have_content @recipe_1.difficulty_level

    expect(page).to have_content @recipe_2.recipe_name
    expect(page).to have_content @recipe_2.food_preference.food_preference_name
    expect(page).to have_content @recipe_2.food_type.food_type_name
    expect(page).to have_content @recipe_2.kitchen.kitchen_name
    expect(page).to have_content @recipe_2.difficulty_level
  end

  scenario 'and click the name to view the recipe' do
    click_link @recipe.recipe_name

    expect(page).to have_content @recipe.recipe_name
    expect(page).to have_content @recipe.food_preference.food_preference_name
    expect(page).to have_content @recipe.food_type.food_type_name
    expect(page).to have_content @recipe.kitchen.kitchen_name
    expect(page).to have_content @recipe.amount_people
    expect(page).to have_content @recipe.cooking_time
    expect(page).to have_content @recipe.difficulty_level
    expect(page).to have_content @recipe.ingredients
    expect(page).to have_xpath("//img[contains(@src, 'bife_a_milanesa.jpg')]")
    expect(page).to have_content @recipe.step_by_step
  end
end
