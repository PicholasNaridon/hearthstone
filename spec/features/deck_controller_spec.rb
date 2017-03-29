require 'rails_helper'

RSpec.describe DecksController, type: :controller do

  describe "POST #add_card" do
    context "with valid params" do
      it "creates a new item" do
        expect { post :add_card, { deck_id: deck.id, card_id: card_id } }
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe "get #delete_card" do
    context "with valid params" do
      it "creates a new item" do
        expect { get :delete_card, { deck_id: deck.id, card_id: card_id } }
        expect(response).to have_http_status(:success)
      end
    end
  end
end
