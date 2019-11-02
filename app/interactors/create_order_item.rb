class CreateOrderItem
  include Interactor

  def call
    order_item = OrderItem.create(context.params)

    return context.fail! unless order_item

    new_total = context.current_order.total_price + order_item.book.price * order_item.quantity
    context.current_order.update(total_price: new_total)
  end
end
