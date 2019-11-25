class CartsController < ApplicationController
  before_action :authenticate_user!

  def cart_toggle
    item = Item.find(params[:item_id])
    item.carts.create!(cart_params)
    # cart = item.carts.find_by(cart_params)
    redirect_to item_path(item)
  end 

  private
  
  def cart_params
    {
      user: current_user,
      item_id: params[:item_id],
      cart_item_name: params.permit(:cart_item_name),
      cart_item_quantity: params.permit(:cart_item_quantity),
    }
    # cart_item_name: params[:cart_item_name],
    # cart_item_quantity: params[:cart_item_quantity]
        
    # cart: params[:cart_item_name, :cart_item_quantity],
  end

end
