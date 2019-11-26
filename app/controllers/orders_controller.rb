class OrdersController < ApplicationController
  before_action :authenticate_user!

  def tmp
    item = Item.find(params[:item_id])
    quantity = params[:quantity]
    commit = params[:commit]
  end
end
