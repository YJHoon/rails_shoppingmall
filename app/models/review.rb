class Review < ApplicationRecord
  ratyrate_rateable "rating"
  belongs_to :user
  belongs_to :item, counter_cache: true

  validates :body, presence: true
  # validates :rating, numericality: {greater_than_or_equal_to: 1}
end
