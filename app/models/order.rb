class Order < ApplicationRecord
  belongs_to :user

  has_many :line_items, dependent: :destroy

  validates :state, presence: true
  validates :order_number, presence: true
  validates :orderer, presence: true
  validates :phone, presence: true
  validates :zipcode, presence: true
  validates :address1, presence: true
  validates :total, numericality: {greater_than_or_equal_to: 0}
  validates :shipping_fee, numericality: {greater_than_or_equal_to: 0}

  enum state: %i[cart buy_now paid]
end
