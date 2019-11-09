class ReviewsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item

  def create
    current_user.reviews.create!(
      item: @item,
      body: review_params[:body],
      rating: review_params[:rating]
    )
    redirect_to item_path(@item)
  end

  def destroy
    @review = @item.reviews.find(params[:id])
    @review.destroy!
    redirect_to item_path(@item)
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def review_params
    params.require(:review).permit(:body, :rating)
  end
end
