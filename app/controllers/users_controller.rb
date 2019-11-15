class UsersController < ApplicationController
  def mypage
    @items = current_user.items
    @reviews = current_user.reviews
    @wishes = current_user.wished_items
  end
end
