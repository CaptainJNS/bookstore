class CalculateDiscount
  include Interactor

  def call
    context.discount = discount(context.current_order.coupon)
    context.current_order.update(total_price: total_price)
  end

  private

  def discount(coupon)
    return context.current_order.sub_price * coupon.discount / 100 if coupon

    0
  end

  def total_price
    context.current_order.sub_price - context.discount
  end
end
