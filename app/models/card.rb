class Card < ActiveRecord::Base
  has_many :includes_card
  has_many :decks, through: :includes_card
end
