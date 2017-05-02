class User < ActiveRecord::Base
  has_many :userprojects
  has_many :projects, through: :userprojects

  validates :first_name, :last_name, presence: true, length: { in: 2..20 }
  validates :email, uniqueness: true, length: { in: 2..30 }, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }, allow_nil: true, allow_blank: true  #first and last time I use regex
end
