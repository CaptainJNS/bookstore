class UpdateTotalPrice
  def call(order, price, quantity, method)
    difference = price * quantity - order.discount(price)

    method == :remove ? order.decrement!(:total_price, difference) : order.increment!(:total_price, difference)
  end
end
