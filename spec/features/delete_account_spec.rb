require 'rails_helper'

feature "Delete Account" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario 'clicking delete should delete account when signed in ' do
    sign_in(user)
    click_link 'My Profile'
    click_button 'Cancel my account'

    expect(page).to have_content("Bye! Your account has been successfully cancelled. We hope to see you again soon.")
    expect(page).to have_content("Sign Up")
    expect(page).to have_content("Login")
    expect(page).to_not have_content("Sign Out")
  end
end
