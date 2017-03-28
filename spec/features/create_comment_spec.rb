require 'rails_helper'

feature "Add comment" do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:deck) { FactoryGirl.create(:deck, user: user) }

  scenario 'clicking submit a review should submit a review when signed in ' do
    sign_in(user)
    visit deck_path(deck)
    fill_in 'Add Comment', with: "Test comment"
    choose("comment_rating_1")
    click_button "Submit"
  end

  scenario 'Adding a review with a blank body' do
    sign_in(user)
    visit deck_path(deck)
    fill_in 'Add Comment', with: ""
    choose("comment_rating_1")
    click_button "Submit"

    expect(page).to have_content("Review did not save.")
  end

  scenario 'Adding a review with a blank rating' do
    sign_in(user)
    visit deck_path(deck)
    fill_in 'Add Comment', with: "test"
    click_button "Submit"

    expect(page).to have_content("Review did not save.")
  end

  scenario 'Unauthenticated user attempts to add review' do
  visit deck_path(deck)

  expect(page).to_not have_content("Submit a review")
  end
end
