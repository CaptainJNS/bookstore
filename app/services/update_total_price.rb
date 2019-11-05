class UpdateTotalPrice
  def call(order, price, quantity, discount, method)
    multiplier = method == :remove ? -1 : 1

    order.update(total_price: total_price(order, price, quantity, discount, multiplier))
  end

  private

  def total_price(order, price, quantity, discount, multiplier)
    order.total_price + (price * quantity - discount) * multiplier
  end
end
