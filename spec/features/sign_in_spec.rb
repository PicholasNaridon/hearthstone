require 'rails_helper'

feature "Login" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'clicking login will login to my account' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Log in'

    expect(page).to have_content("Signed in successfully.")
    expect(page).to have_content("My Profile")
    expect(page).to have_content("Sign Out")
    expect(page).to_not have_content("Sign In")
  end

  scenario 'Unsuccessful Sign in' do
    visit root_path
    click_link 'Login'
    fill_in 'Email', with: ''
    fill_in 'Password', with: 'password'
    click_button 'Log in'

    # expect(page).to have_content("Invalid Email or password.")
    expect(page).to have_content("Login")
  end
end
