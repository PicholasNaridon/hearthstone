class Comment < ApplicationRecord
  validates :body, presence: true
  validates :rating, presence: true
  validates_numericality_of :rating, greater_than_or_equal_to: 1, less_than_or_equal_to: 5, message: "Rating must be between 1 - 5"
  belongs_to :deck
  belongs_to :user
end
