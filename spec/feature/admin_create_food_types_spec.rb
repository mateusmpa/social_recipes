require 'rails_helper'

feature 'Admin create food_types' do
  before(:each) { visit new_food_type_path }

  scenario 'successfully' do
    fill_in 'Tipo de comida', with: 'acompanhamento'

    click_button 'Cadastrar tipo de comida'

    expect(page).to have_content 'acompanhamento'
  end

  scenario 'with empty mandatory fields' do
    click_button 'Cadastrar tipo de comida'

    expect(page).to have_content 'Tipo de comida é obrigatório'
  end
end
