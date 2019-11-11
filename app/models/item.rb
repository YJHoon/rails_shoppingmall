class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_many :wishes, dependent: :destroy
  has_many :wished_users, through: :wishes, source: :user
  # 여기서 source는 wish 모델의 belongs_to :user 관계를 기반으로 찾아옴
  mount_uploader :image, ImageUploader

  validates :display_name, presence: true#, uniqueness: true

  def image_url
    image.url.present? ? image.url : "/simple.png"
  end

  def rating_avg
    (reviews.sum(:rating) / reviews_count.to_f) rescue 0
  end
end
