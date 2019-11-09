class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy

  mount_uploader :image, ImageUploader

  # validates :title, presence: true

  def image_url
    image.url.present? ? image.url : "/simple.png"
  end

  # 디비 설계 다시하기, 컬럼이름 명시적으로 다바꾸고, default 필요없는거 다 삭제
  # rename_column, change_column
end
