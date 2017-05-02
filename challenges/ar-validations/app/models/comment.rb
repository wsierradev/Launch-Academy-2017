class Comment < ActiveRecord::Base
  belongs_to :recipe

  validates :body, length: { maximum: 140 }
  validates_presence_of :recipe
end
