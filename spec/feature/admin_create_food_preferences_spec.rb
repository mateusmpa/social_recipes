require 'rails_helper'

feature 'Admin create food_preferences' do
  before(:each) { visit new_food_preference_path }

  scenario 'successfully' do
    fill_in 'Preferência de comida', with: 'carnes'

    click_button 'Cadastrar preferência de comida'

    expect(page).to have_content 'carnes'
  end

  scenario 'with empty mandatory fields' do
    click_button 'Cadastrar preferência de comida'

    expect(page).to have_content 'Preferência de comída é obrigatório'
  end
end
