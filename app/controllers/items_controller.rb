class ItemsController < ApplicationController
  before_action :set_item, only: %i[show edit update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    @items = Item.all
  end

  def show
    @new_review = Review.new
    @reviews = @item.reviews.order(created_at: :desc)
  end

  def new
    @item = current_user.items.new
  end

  def edit
  end

  def create
    item = current_user.items.create!(item_params)
    redirect_to item_path(item), notice: '게시글이 정상적으로 생성되었습니다.'
  end

  def update
    @item.update_attributes!(item_params)
    redirect_to item_path(@item), notice: '게시글이 정상적으로 수정되었습니다.'
  end

  def destroy
    @item.destroy!
    redirect_to root_path, notice: '게시글이 정상적으로 삭제되었습니다.'
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params[:item].permit(:display_name, :item_explain, :image, :price, :itemname, :quantity)
  end
end
