class DestroyOrderItem
  include Interactor

  def call
    order_item = OrderItem.find(context.order_item_id)
    UpdateTotalPrice.new.call(context.current_order, order_item.book.price, order_item.quantity, discount(order_item.book.price), :remove)
    order_item.destroy
  rescue ActiveRecord::RecordNotFound
    context.fail!
  end

  private

  def discount(price)
    return price * context.current_order.coupon.discount / Constants::DOZEN if context.current_order.coupon

    Constants::ZERO
  end
end
