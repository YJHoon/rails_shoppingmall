class LineItem < ApplicationRecord
  belongs_to :order
  belongs_to :item

  validates :quantity, numericality: {greater_than_or_equal_to: 1}
  validates :unit_price, numericality: {greater_than_or_equal_to: 0}
  validates :total, numericality: {greater_than_or_equal_to: 0}
end
