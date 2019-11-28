class UpdateOrderItem
  include Interactor

  def call
    order_item = OrderItem.find_by(id: context.order_item_id, order: context.order)
    return context.fail! unless order_item

    case context.action
    when 'plus' then increment_quantity(order_item)
    when 'minus' then decrement_quantity(order_item)
    end
  end

  private

  def increment_quantity(order_item)
    order_item.increment!(:quantity, 1)
    UpdateTotalPrice.call(context.order, price: order_item.book.price, action: :plus)
  end

  def decrement_quantity(order_item)
    return unless order_item.quantity > 1

    order_item.decrement!(:quantity, 1)
    UpdateTotalPrice.call(context.order, price: order_item.book.price, action: :minus)
  end
end
