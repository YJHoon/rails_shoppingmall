class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :nullify

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
