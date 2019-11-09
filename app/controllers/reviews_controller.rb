class ReviewsController < ApplicationController
  before_action :authenticate_user!

  def create
    current_user.reviews.create!(
      item: @item,
      body: review_params[:body]
    )
    redirect_to item_path(@item)
  end

  def destroy
    @review = @item.reviews.find(params[:id])
    @review.destroy!
    redirect_to item_path(@item)
  end

  private
  def review_params
    params.require(:review).permit(:bpdy)
  end
end
