require "rails_helper"

RSpec.describe Api::V1::CardsController, type: :controller do
  describe "GET #index" do
    let!(:card1) { Card.create(name: "Card One") }
    let!(:card2) { Card.create(name: "Card Two") }

    it "should return all items" do
      get :index
      json = JSON.parse(response.body)

      expect(json.length).to eq(2)
      expect(json[0]["name"]).to eq("Card One")
      expect(json[1]["name"]).to eq("Card Two")
    end
  end
end
