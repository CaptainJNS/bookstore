class CreateOrderItem
  include Interactor

  def call
    order_item = OrderItem.create(context.params)

    return context.fail! unless order_item

    UpdateTotalPrice.new.call(context.current_order, order_item.book.price, order_item.quantity, :add)
  end
end
