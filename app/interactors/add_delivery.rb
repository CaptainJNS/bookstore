class AddDelivery
  include Interactor

  def call
    delivery = Delivery.find_by(id: context.delivery_id)

    return context.fail! unless delivery

    context.current_order.update(delivery_id: delivery.id)
    context.current_order.increment!(:total_price, delivery.price)
  end
end
