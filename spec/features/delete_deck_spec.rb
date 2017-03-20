require 'rails_helper'

feature "Delete Deck" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:deck) { FactoryGirl.create(:deck, user: user) }

  scenario 'clicking delete should delete deck when signed in ' do
    sign_in(user)
    visit deck_path(deck)
    click_link 'Delete Deck'

    expect(page).to have_content("Deck has been deleted")
    expect(page).to_not have_content(deck.name)
  end

  scenario 'clicking on item should not show "Delete Deck" when signed out' do
    sign_in(user)
    visit deck_path(deck)
    click_link 'Sign Out'
    visit deck_path(deck)

    expect(page).to_not have_content("Delete Deck")
  end
end
