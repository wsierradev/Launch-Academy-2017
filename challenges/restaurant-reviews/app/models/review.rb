class Review < ApplicationRecord
  belongs_to :restaurant

  validates :body, presence: true
  validates :rating, presence: true, numericality: {
    only_integer: true,
    greater_than_or_equal_to: 0,
    less_than_or_equal_to: 5, message: 'must be between 1 - 5'}

end
