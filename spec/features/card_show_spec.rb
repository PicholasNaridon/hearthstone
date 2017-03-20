require 'rails_helper'

feature "User creates new item" do
  let!(:card_one) { FactoryGirl.create(:card) }
  let!(:card_two) { FactoryGirl.create(:card) }


  scenario "clicking a card" do
    visit card_path(card_one)

    expect(page).to have_content(card_one.name)
    expect(page).to have_content(card_one.faction)
    expect(page).to have_content(card_one.rarity)
    expect(page).to have_content(card_one.cost)
    expect(page).to have_content(card_one.artist)
    expect(page).to have_content(card_one.collectible)

    expect(page).to_not have_content(card_two.name)

  end
end
