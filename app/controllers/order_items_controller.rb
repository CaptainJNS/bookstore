class OrderItemsController < ApplicationController
  def index
    @order = Order.find(session[:order_id])
  end
end
