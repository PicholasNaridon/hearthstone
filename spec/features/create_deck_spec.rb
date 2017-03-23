require 'rails_helper'

feature "User creates new item" do
  let!(:user) { FactoryGirl.create(:user) }

  scenario "clicking add deck will add deck to list" do
    sign_in(user)
    click_link 'Decks'
    click_link 'New Deck'
    fill_in 'Name', with: "Deck 1"
    click_button 'Create Deck'

    expect(page).to have_content("Deck created")
    expect(page).to have_content("Deck 1")
    expect(page).to have_content(user.username)
  end

  scenario "deck with no name can't be saved" do
    sign_in(user)
    click_link 'Decks'
    click_link 'New Deck'
    fill_in 'Name', with: nil
    click_button 'Create Deck'

    expect(page).to_not have_content("Deck Created")
    expect(page).to have_content("Name can't be blank")
  end
end
