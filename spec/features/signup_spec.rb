require 'rails_helper'

feature 'Sign up' , %Q{
  As an authenticated user
  I want to sign up
  So that I can add items and reviews
} do

  # * Acceptance CRITERIA
  # * I must specify a valid email adderss
  # * I must specify a password, and confirm that passowrd
  # * If I do not perform the above, I get an error message
  # * If I specify valid information, I register my account and am authenticated

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
