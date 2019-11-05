class CreateOrderItem
  include Interactor

  def call
    order_item = OrderItem.create(context.params)

    return context.fail! unless order_item

    UpdateTotalPrice.new.call(context.current_order, order_item.book.price, order_item.quantity, discount(order_item.book.price), :add)
  end

  private

  def discount(price)
    return price * context.current_order.coupon.discount / Constants::DOZEN if context.current_order.coupon

    Constants::ZERO
  end
end
