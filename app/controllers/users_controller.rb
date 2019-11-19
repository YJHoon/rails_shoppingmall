class UsersController < ApplicationController
  before_action :authenticate_user!
  
  def mypage
    @items = current_user.items
    @reviews = current_user.reviews
    @wishes = current_user.wished_items
  end

  def mywish
    @wishes = current_user.wished_items
  end
end
