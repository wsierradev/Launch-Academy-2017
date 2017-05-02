class Recipe < ActiveRecord::Base
  has_many :comments

  validates :name, presence: true, uniqueness: true
  validates :servings, numericality: { greater_than_or_equal_to: 1 },
    unless: "servings.nil?"
  validate :name_must_include_brussels


  def name_must_include_brussels
    input = "name.downcase"
    unless input.include?('brussels sprouts')
      errors.add(:name, "only 'Brussels Sprouts' recipes allowed")
    end
  end
end
