require 'rails_helper'

feature "Sign Out" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'clicking sign out button and successfully signing out' do
    sign_in(user)
    click_link 'Sign Out'

    expect(page).to have_content("Signed out successfully.")
    expect(page).to have_content("Login")
    expect(page).to have_content("Sign Up")
    expect(page).to_not have_content("Sign Out")
  end

  scenario 'Visiting root and expect not to see sign out' do
    visit root_path
    expect(page).to_not have_content("Sign Out")
  end
end
