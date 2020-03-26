class Review < ApplicationRecord
  belongs_to :cocktail
  validates :content, presence: true
  validates :rating, numericality: true
end
