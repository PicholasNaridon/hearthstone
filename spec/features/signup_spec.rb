require 'rails_helper'

feature "Sign Up" do

  scenario 'specifying valid and required information' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'

    expect(page).to have_content("Welcome! You have signed up successfully.")
    expect(page).to have_content("Sign Out")
  end

  scenario 'Sign up with taken email' do
    visit root_path
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password'
    click_button 'Sign up'
    click_link 'Sign Out'
    click_link 'Sign Up'
    fill_in 'Username', with: 'Jon'
    fill_in 'Email', with: 'test@test.com'
    fill_in 'Password', with: 'password'
    fill_in 'Password confirmation', with: 'password1'
    click_button 'Sign up'

    expect(page).to have_content("Email has already been taken")
    expect(page).to have_content("Password confirmation doesn't match Password")
    expect(page).to_not have_content("Welcome! You have signed up successfully.")
    expect(page).to_not have_content("Sign Out")

  end
end
