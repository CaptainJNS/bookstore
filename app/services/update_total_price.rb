class UpdateTotalPrice
  attr_reader :order, :price, :quantity, :action

  def initialize(order, order_item, action)
    @order = order
    @price = order_item.price
    @quantity = order_item.quantity
    @action = action
  end

  def self.call(*args)
    new(*args).call
  end

  def call
    difference = price * quantity - order.discount(price)

    case action
    when :remove then order.decrement!(:total_price, difference)
    when :add then order.increment!(:total_price, difference)
    end
  end
end
