class AddCoupon
  include Interactor

  def call
    return context.current_order.update(coupon: Coupon.find_by(code: context.code)) if coupon_valid?

    context.fail!
  end

  private

  def coupon_valid?
    Coupon.exists?(code: context.code, active: true)
  end
end
