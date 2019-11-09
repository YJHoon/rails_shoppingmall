class Post < ApplicationRecord
  belongs_to :user, optional: true
  
  mount_uploader :image, ImageUploader

  def image_url
    image.url.present? ? image.url : "/simple.png"
  end
end
