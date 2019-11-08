class AddCoupon
  include Interactor

  def call
    return context.fail! if coupon_attached?

    return context.fail! unless coupon_valid?

    coupon = Coupon.find_by(code: context.code)

    context.current_order.update(coupon: coupon)
    context.current_order.decrement!(:total_price, context.current_order.discount)
  end

  private

  def coupon_valid?
    Coupon.exists?(code: context.code, active: true)
  end

  def coupon_attached?
    context.current_order.coupon.present?
  end
end
