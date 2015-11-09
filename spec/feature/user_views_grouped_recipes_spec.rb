require 'rails_helper'

feature 'User views grouped recipes' do
  before(:each) {
    @food_preference_1 = create(:food_preference, food_preference_name: 'massas')
    @food_preference_2 = create(:food_preference, food_preference_name: 'doces')

    @food_type_1 = create(:food_type, food_type_name: 'prato principal')
    @food_type_2 = create(:food_type, food_type_name: 'sobremesa')

    @kitchen_1 = create(:kitchen, kitchen_name: 'Italiana')
    @kitchen_2 = create(:kitchen, kitchen_name: 'Mexicana')

    @recipe_1 = create(:recipe, recipe_name: 'Macarronada', kitchen: @kitchen_1,
                                food_preference: @food_preference_1,
                                food_type: @food_type_1)
    @recipe_2 = create(:recipe, recipe_name: 'Paleta', kitchen: @kitchen_2,
                                food_preference: @food_preference_2,
                                food_type: @food_type_2)

    visit root_path
  }

  scenario 'by food_preference' do
    expect(page).to have_content @food_preference_1.food_preference_name
    expect(page).to have_content @food_preference_2.food_preference_name

    click_link @food_preference_1.food_preference_name

    expect(page).to have_content @recipe_1.recipe_name
    expect(page).to have_content @recipe_1.food_preference.food_preference_name
    expect(page).to have_content @recipe_1.food_type.food_type_name
    expect(page).to have_content @recipe_1.kitchen.kitchen_name
    expect(page).to have_content @recipe_1.difficulty_level

    expect(page).not_to have_content @recipe_2.recipe_name
    expect(page).not_to have_content @recipe_2.food_preference.food_preference_name
    expect(page).not_to have_content @recipe_2.food_type.food_type_name
    expect(page).not_to have_content @recipe_2.kitchen.kitchen_name
    expect(page).not_to have_content @recipe_2.difficulty_level
  end

  scenario 'by kitchen' do
    expect(page).to have_content @kitchen_1.kitchen_name
    expect(page).to have_content @kitchen_2.kitchen_name

    click_link @kitchen_1.kitchen_name

    expect(page).to have_content @recipe_1.recipe_name
    expect(page).to have_content @recipe_1.food_preference.food_preference_name
    expect(page).to have_content @recipe_1.food_type.food_type_name
    expect(page).to have_content @recipe_1.kitchen.kitchen_name
    expect(page).to have_content @recipe_1.difficulty_level

    expect(page).not_to have_content @recipe_2.recipe_name
    expect(page).not_to have_content @recipe_2.food_preference.food_preference_name
    expect(page).not_to have_content @recipe_2.food_type.food_type_name
    expect(page).not_to have_content @recipe_2.kitchen.kitchen_name
    expect(page).not_to have_content @recipe_2.difficulty_level
  end

  scenario 'by food_type' do
    expect(page).to have_content @food_type_1.food_type_name
    expect(page).to have_content @food_type_2.food_type_name

    click_link @food_type_1.food_type_name

    expect(page).to have_content @recipe_1.recipe_name
    expect(page).to have_content @recipe_1.food_preference.food_preference_name
    expect(page).to have_content @recipe_1.food_type.food_type_name
    expect(page).to have_content @recipe_1.kitchen.kitchen_name
    expect(page).to have_content @recipe_1.difficulty_level

    expect(page).not_to have_content @recipe_2.recipe_name
    expect(page).not_to have_content @recipe_2.food_preference.food_preference_name
    expect(page).not_to have_content @recipe_2.food_type.food_type_name
    expect(page).not_to have_content @recipe_2.kitchen.kitchen_name
    expect(page).not_to have_content @recipe_2.difficulty_level
  end
end
