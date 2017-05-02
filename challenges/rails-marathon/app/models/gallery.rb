class Gallery < ApplicationRecord
  has_many :paintings
    validates :name, presence: true
    validates :city, presence: true
    validates :zipcode, presence: true, length: { is: 5 }
end
