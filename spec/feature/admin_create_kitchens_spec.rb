require 'rails_helper'

feature 'Admin create kitchens' do
  before(:each) { visit new_kitchen_path }
  scenario 'successfully' do
    fill_in 'Cozinha', with: 'Brasileira'

    click_button 'Cadastrar cozinha'

    expect(page).to have_content 'Brasileira'
  end

  scenario 'with empty mandatory fields' do
    click_button 'Cadastrar cozinha'

    expect(page).to have_content 'Cozinha é obrigatório'
  end
end
