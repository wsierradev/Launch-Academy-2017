class Project < ActiveRecord::Base
  has_many :userprojects
  has_many :users, through: :userprojects

  validates :name, presence: true
end
