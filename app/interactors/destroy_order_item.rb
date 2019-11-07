class DestroyOrderItem
  include Interactor

  def call
    order_item = OrderItem.find_by(id: context.order_item_id)
    return context.fail! unless order_item

    UpdateTotalPrice.new.call(context.current_order, order_item.book.price, order_item.quantity, :remove)
    order_item.destroy
  end
end
