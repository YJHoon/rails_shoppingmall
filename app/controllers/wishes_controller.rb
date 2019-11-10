class WishesController < ApplicationController
  before_action :authenticate_user!
  
  def wish_toggle
    #주의할 점
    # Wish 전체에서 찾지 말고 특정 item의 wish로 범위 한정 시키기
    item = Item.find(params[:item_id])
    wish = item.wishes.find_by(user: current_user,
                              item_id: params[:item_id])
    if wish.nil?
      item.wishes.create!(user: current_user,
                          item_id: params[:item_id])
    else
      wish.destroy
    end

    # rails 5부터는 redirect_back 대신 redirect_back을 이용한다고 함.
    # redirect_to :back
    # 근데 root_path인데 왜 뒤로 가는건지 모르겠음
    redirect_back(fallback_location: root_path)
  end

end
