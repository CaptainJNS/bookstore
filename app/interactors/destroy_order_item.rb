class DestroyOrderItem
  include Interactor

  def call
    order_item = OrderItem.find_by(id: context.order_item_id)
    return context.fail! unless order_item

    UpdateTotalPrice.call(context.current_order, order_item: order_item.decorate, action: :remove)
    order_item.destroy
  end
end
