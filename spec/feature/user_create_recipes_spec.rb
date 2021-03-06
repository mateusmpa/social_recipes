require 'rails_helper'

feature 'User create recipes' do
  before(:each) do
    @kitchen = create(:kitchen)
    @food_type = create(:food_type)
    @food_preference = create(:food_preference)
    visit new_recipe_path
  end

  scenario 'successfully' do
    fill_in 'Nome da receita', with: 'Bife a Milanesa'
    select @kitchen.kitchen_name, from: 'Cozinha'
    select @food_type.food_type_name, from: 'Tipo de comida'
    select @food_preference.food_preference_name, from: 'Preferência de comida'
    fill_in 'Quantas pessoas serve', with: 6
    fill_in 'Tempo de preparo', with: 40
    fill_in 'Nível de dificuldade', with: 'fácil'
    fill_in 'Ingredientes', with: 'Inserindo ingredientes...'
    fill_in 'Passo a passo', with: 'Inserindo passo a passo...'
    attach_file 'Fotografia', 'spec/test_files/bife_a_milanesa.jpg'

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Bife a Milanesa'
    expect(page).to have_content @kitchen.kitchen_name
    expect(page).to have_content @food_type.food_type_name
    expect(page).to have_content @food_preference.food_preference_name
    expect(page).to have_content 6
    expect(page).to have_content 40
    expect(page).to have_content 'fácil'
    expect(page).to have_content 'Inserindo ingredientes...'
    expect(page).to have_content 'Inserindo passo a passo...'
    expect(page).to have_xpath("//img[contains(@src, 'bife_a_milanesa.jpg')]")
  end

  scenario 'with empty mandatory fields' do
    visit new_recipe_path

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Nome da receita é obrigatório'
    expect(page).to have_content 'Cozinha é obrigatório'
    expect(page).to have_content 'Tipo de comida é obrigatório'
    expect(page).to have_content 'Preferência de comída é obrigatório'
    expect(page).to have_content 'Ingredientes é obrigatório'
    expect(page).to have_content 'Passo a passo é obrigatório'
  end

  scenario 'without photograph' do
    fill_in 'Nome da receita', with: 'Bife a Milanesa'
    select @kitchen.kitchen_name, from: 'Cozinha'
    select @food_type.food_type_name, from: 'Tipo de comida'
    select @food_preference.food_preference_name, from: 'Preferência de comida'
    fill_in 'Ingredientes', with: 'Inserindo ingredientes...'
    fill_in 'Passo a passo', with: 'Inserindo passo a passo...'

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Bife a Milanesa'
    expect(page).to have_content @kitchen.kitchen_name
    expect(page).to have_content @food_type.food_type_name
    expect(page).to have_content @food_preference.food_preference_name
    expect(page).to have_content 'Inserindo ingredientes...'
    expect(page).to have_content 'Inserindo passo a passo...'
    expect(page).to have_xpath("//img[contains(@src, 'sem_foto.gif')]")
  end

  scenario 'invalid photograph' do
    fill_in 'Nome da receita', with: 'Bife a Milanesa'
    select @kitchen.kitchen_name, from: 'Cozinha'
    select @food_type.food_type_name, from: 'Tipo de comida'
    select @food_preference.food_preference_name, from: 'Preferência de comida'
    fill_in 'Ingredientes', with: 'Inserindo ingredientes...'
    fill_in 'Passo a passo', with: 'Inserindo passo a passo...'
    attach_file 'Fotografia', 'spec/test_files/test.txt'

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Só é permitido inserir imagem'
  end
end
