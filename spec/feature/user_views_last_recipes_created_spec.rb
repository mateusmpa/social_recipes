require 'rails_helper'

feature 'User views last recipes created at home' do
  scenario 'user views recent recipe' do
    30.times do |i|
      create(:recipe, recipe_name: 'Frango a passarinho',
                      created_at: i.days.ago) if i == 0
      next if i == 0
      create(:recipe, created_at: i.days.ago)
    end

    visit root_path

    expect(page).to have_content 'Frango a passarinho'
  end

  scenario 'user does not see old recipe' do
    30.times do |i|
      create(:recipe, recipe_name: 'Frango a passarinho',
                      created_at: i.days.ago) if i == 29
      next if i == 29
      create(:recipe, created_at: i.days.ago)
    end

    visit root_path

    expect(page).not_to have_content 'Frango a passarinho'
  end

  scenario 'user views 20th recipe' do
    30.times do |i|
      create(:recipe, recipe_name: 'Frango a passarinho',
                      created_at: i.days.ago) if i == 19
      next if i == 19
      create(:recipe, created_at: i.days.ago)
    end

    visit root_path

    expect(page).to have_content 'Frango a passarinho'
  end

  scenario 'user does not views 21th recipe' do
    30.times do |i|
      create(:recipe, recipe_name: 'Frango a passarinho',
                      created_at: i.days.ago) if i == 20
      next if i == 20
      create(:recipe, created_at: i.days.ago)
    end

    visit root_path

    expect(page).not_to have_content 'Frango a passarinho'
  end
end
