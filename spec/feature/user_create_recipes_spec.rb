require 'rails_helper'

feature 'User create recipes' do
  before(:each) { visit new_recipe_path }

  scenario 'successfully' do
    fill_in 'Nome da receita', with: 'Bife a Milanesa'
    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Tipo de comida', with: 'acompanhamento'
    fill_in 'Preferência de comida', with: 'carnes'
    fill_in 'Quantas pessoas serve', with: 6
    fill_in 'Tempo de preparo', with: 40
    fill_in 'Nível de dificuldade', with: 'fácil'
    fill_in 'Ingredientes', with: 'Inserindo ingredientes...'
    fill_in 'Passo a passo', with: 'Inserindo passo a passo...'
    attach_file 'Fotografia', 'spec/test_files/bife_a_milanesa.jpg'

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Bife a Milanesa'
    expect(page).to have_content 'Brasileira'
    expect(page).to have_content 'acompanhamento'
    expect(page).to have_content 'carnes'
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
    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Tipo de comida', with: 'acompanhamento'
    fill_in 'Preferência de comida', with: 'carnes'
    fill_in 'Ingredientes', with: 'Inserindo ingredientes...'
    fill_in 'Passo a passo', with: 'Inserindo passo a passo...'

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Bife a Milanesa'
    expect(page).to have_content 'Brasileira'
    expect(page).to have_content 'acompanhamento'
    expect(page).to have_content 'carnes'
    expect(page).to have_content 'Inserindo ingredientes...'
    expect(page).to have_content 'Inserindo passo a passo...'
    expect(page).to have_xpath("//img[contains(@src, 'sem_foto.gif')]")
  end

  scenario 'invalid photograph' do
    fill_in 'Nome da receita', with: 'Bife a Milanesa'
    fill_in 'Cozinha', with: 'Brasileira'
    fill_in 'Tipo de comida', with: 'acompanhamento'
    fill_in 'Preferência de comida', with: 'carnes'
    fill_in 'Ingredientes', with: 'Inserindo ingredientes...'
    fill_in 'Passo a passo', with: 'Inserindo passo a passo...'
    attach_file 'Fotografia', 'spec/test_files/test.txt'

    click_button 'Cadastrar receita'

    expect(page).to have_content 'Só é permitido inserir imagem'
  end
end
