class Member < ActiveRecord::Base
  validates :user_id, presence: true, uniqueness: true
  validates :meetup_id, presence: true, uniqueness: true

  belongs_to :meetup
  belongs_to :user
end
