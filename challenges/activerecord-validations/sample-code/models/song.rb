class Song < ActiveRecord::Base
validates :year, presence: true
validates :year, numericality: true, length: { is: 4 }

end
