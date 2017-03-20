class HomeController < ApplicationController
  def index
    @deck = Deck.new
    @user = current_user
    @decks = Deck.all
  end
end
