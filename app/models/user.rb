class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :items, dependent: :destroy
  has_many :reviews, dependent: :destroy
  #찜하기
  has_many :wishes, dependent: :destroy
  has_many :wished_items, through: :wishes, source: :item
  # user가 찜한 아이템을 가져오는데 wishes를 토대로 item을 가져온다
  # 유저 삭제되면 유저가 찜한 기록 삭제 되는건데,
  # wishes - 유저가 가진 wishes 기록 사라짐
  # wished_items - 유저가 찜했던 아이템 기록 사라짐 ??? -> 둘이 의미하는게 정확히 뭐가 다른거지?

  #     User --- Wish --- Item

  def is_wish?(item)
    Wish.find_by(user_id: self.id, item_id: item.id).present?
  end

  def say_hello
    puts 'hello hi'
  end

  def create_post(post_params)
    self.posts.create!(post_params)
  end

  def self.say_hello
    puts 'hello world'
  end
end
