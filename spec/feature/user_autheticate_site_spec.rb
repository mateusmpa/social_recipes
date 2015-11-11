require 'rails_helper'

feature 'User authenticate site' do
  scenario 'into login page' do
    user = create(:user, email: 'teste@gmail.com', password: 'inicial1234')

    visit new_user_session_path
    #binding.pry
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password

    click_button 'Log in'

    expect(page).to have_content 'Signed in successfully.'
  end
end
