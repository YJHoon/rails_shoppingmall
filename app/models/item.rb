class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  mount_uploader :image, ImageUploader

  validates :display_name, presence: true#, uniqueness: true

  def image_url
    image.url.present? ? image.url : "/simple.png"
  end
end
