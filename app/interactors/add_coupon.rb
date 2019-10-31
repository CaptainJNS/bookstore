class AddCoupon
  include Interactor

  def call
    if coupon_valid?
      context.current_order.update(coupon: Coupon.find_by(code: context.code))
    else
      context.fail!
    end
  end

  private

  def coupon_valid?
    Coupon.exists?(code: context.code, active: true)
  end
end
