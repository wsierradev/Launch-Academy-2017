class Meetup < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: { maximum: 1000 }
  validates :location, presence: true
  validates :creator, presence: true

  has_many :members
  has_many :users, through: :members
end
