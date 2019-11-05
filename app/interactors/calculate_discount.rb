class CalculateDiscount
  include Interactor

  def call
    context.discount = discount(context.current_order.coupon)
  end

  private

  def discount(coupon)
    return context.current_order.sub_price * coupon.discount / Constants::DOZEN if coupon

    Constants::ZERO
  end
end
