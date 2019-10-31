class CreateOrderItem
  include Interactor

  def call
    order_item = OrderItem.create(context.params)
    if order_item
      new_total = context.current_order.total_price + order_item.book.price * order_item.quantity
      context.current_order.update(total_price: new_total)
    else
      context.fail!
    end
  end
end
