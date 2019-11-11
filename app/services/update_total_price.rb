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
    if delivery
      order.increment!(:total_price, @delivery.price)
    end

    if coupon
      order.decrement!(:total_price, @order.discount)
    end

    if order_item && action
      difference = order_item.price * order_item.quantity - order.discount(order_item.price)

      case action
      when :remove then order.decrement!(:total_price, difference)
      when :add then order.increment!(:total_price, difference)
      end
    end
  end
end
