class OrderItemsController < ApplicationController
  def index
    @order = Order.find(session[:order_id])
  end

  def create
    OrderItem.create(order_item_params)
  end

  def destroy
    OrderItem.find(params[:id]).destroy
    redirect_to order_order_items_path(current_order)
  end

  private

  def order_item_params
    params.permit(%i[book_id quantity order_id])
  end
end
