class OrderItemsController < ApplicationController
  def index
    @order = Order.find(session[:order_id])
  end

  def create
    OrderItem.create(order_item_params)
  end

  private

  def order_item_params
    params.permit(%i[book_id quantity order_id])
  end
end
