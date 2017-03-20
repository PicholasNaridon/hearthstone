require 'rails_helper'

feature "Add Review" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:deck) { FactoryGirl.create(:deck, user: user) }

  scenario 'clicking edit should update the deck when signed in ' do
    sign_in(user)
    visit deck_path(deck)
    click_link 'Change Name'
    fill_in 'Name', with: "somethingelse"
    click_button 'Create Deck'

    expect(page).to have_content("Your deck name has been updated")
    expect(page).to have_content("somethingelse")
  end

  scenario 'editing deck with blank name' do
    sign_in(user)
    visit deck_path(deck)
    click_link 'Change Name'
    fill_in 'Name', with: ""
    click_button 'Create Deck'

    expect(page).to_not have_content("Your deck has been updated")
    expect(page).to have_content("Name can't be blank")
  end
end
