require 'rails_helper'

RSpec.describe Deck, type: :IncludesCard do
  let!(:user) { FactoryGirl.create(:user) }
  let!(:deck) { FactoryGirl.create(:deck, user: user) }
  let!(:card) { FactoryGirl.create(:card) }
  let!(:hand) { FactoryGirl.create(:IncludesCard)}

end
