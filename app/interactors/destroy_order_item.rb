class DestroyOrderItem
  include Interactor

  def call
    order_item = OrderItem.find(context.order_item_id)
    new_total = context.current_order.total_price - order_item.book.price * order_item.quantity
    order_item.destroy
    context.current_order.update(total_price: new_total)
  rescue ActiveRecord::RecordNotFound
    context.fail!
  end
end
