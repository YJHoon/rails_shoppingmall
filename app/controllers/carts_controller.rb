class CartsController < ApplicationController
  before_action :authenticate_user!

  def cart_toggle
    item = Item.find(params[:item_id])
    # byebug
    item.carts.create!(cart_params)
    redirect_to item_path(item)
  end

  private

  def cart_params
    # {
    #   user: current_user,
    #   item_id: params[:item_id],
    #   cart_item_name: params.require(:cart).permit(:cart_item_name),
    #   cart_item_quantity: params.require(:cart).permit(:cart_item_quantity),
    # }
    # cart_item_name: params[:cart_item_name],
    # cart_item_quantity: params[:cart_item_quantity]

    # cart: params[:cart_item_name, :cart_item_quantity],
    c_params = params.require(:cart).permit(:cart_item_quantity, :cart_item_name)
    c_params[:user_id] = current_user.id
    c_params
  end

end
