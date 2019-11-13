class UpdateTotalPrice
  attr_reader :order, :order_item, :quantity, :action, :delivery, :coupon

  def initialize(order, order_item: nil, action: nil, delivery: nil, coupon: nil)
    @order = order
    @order_item = order_item
    @action = action
    @delivery = delivery
    @coupon = coupon
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    return order.increment!(:total_price, difference) if add_price?

    order.decrement!(:total_price, difference) if minus_price?
  end

  def difference
    return delivery.price if delivery

    return order.discount if coupon

    order_item.price * order_item.quantity - order.discount(order_item.price)
  end

  def add_price?
    action == :add || delivery
  end

  def minus_price?
    action == :remove || coupon
  end
end
