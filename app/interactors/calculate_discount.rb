class CalculateDiscount
  include Interactor

  def call
    if context.current_order.coupon
      context.discount = discount
      context.current_order.update(total_price: context.current_order.sub_price - context.discount)
    else
      context.discount = 0
      context.current_order.update(total_price: context.current_order.sub_price)
    end
  end

  private

  def discount
    context.current_order.sub_price * context.current_order.coupon.discount / 100
  end
end
