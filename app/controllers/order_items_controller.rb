class OrderItemsController < ApplicationController
  def index
    if current_order.coupon
      @discount = discount
      current_order.update(total_price: current_order.sub_price - @discount)
    else
      @discount = 0
      current_order.update(total_price: current_order.sub_price)
    end
    @order = Order.find(session[:order_id]).decorate
  end

  def create
    order_item = OrderItem.create(order_item_params)

    new_total = current_order.total_price + order_item.book.price * order_item.quantity
    current_order.update(total_price: new_total)
  end

  def destroy
    order_item = OrderItem.find(params[:id])
    new_total = current_order.total_price - order_item.book.price * order_item.quantity
    order_item.destroy
    current_order.update(total_price: new_total)
    redirect_to order_order_items_path
  end

  private

  def order_item_params
    params.permit(%i[book_id quantity order_id])
  end

  def discount
    current_order.sub_price * current_order.coupon.discount / 100
  end
end
