class CreateOrderItem
  include Interactor

  def call
    order_item = OrderItem.create(context.params)

    return context.fail! unless order_item

    UpdateTotalPrice.call(context.current_order, order_item: order_item.decorate, action: :add)
  end
end
