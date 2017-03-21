class Deck < ActiveRecord::Base
  belongs_to :user
  has_many :includes_card
  has_many :cards, through: :includes_card



  #validates :cards, length: { is: 30 }
end
