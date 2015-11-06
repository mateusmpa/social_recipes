require 'rails_helper'

feature 'Admin create kitchens' do
  scenario 'successfully' do
    visit new_kitchen_path

    fill_in 'Cozinha', with: 'Brasileira'

    click_button 'Cadastrar cozinha'

    expect(page).to have_content 'Brasileira'
  end

  scenario 'with empty mandatory fields' do
    visit new_kitchen_path

    click_button 'Cadastrar cozinha'

    expect(page).to have_content 'Cozinha é obrigatório'
  end
end
