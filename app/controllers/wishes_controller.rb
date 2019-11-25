class WishesController < ApplicationController
  before_action :authenticate_user!

  def wish_toggle
    #주의할 점
    # Wish 전체에서 찾지 말고 특정 item의 wish로 범위 한정 시키기
    item = Item.find(params[:item_id])
    wish = item.wishes.find_by(wish_params)
    if wish.nil?
      item.wishes.create!(wish_params)
    else
      wish.destroy
    end

    redirect_back(fallback_location: root_path)
  end

  private

  def wish_params
    {
      user: current_user,
      item_id: params[:item_id]
    }
  end
end
