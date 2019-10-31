class OrdersController < ApplicationController
  def update
    if coupon_valid?
      current_order.update(coupon: Coupon.find_by(code: params[:coupon][:code]))
      flash[:notice] = I18n.t('coupons.attached')
    else
      flash[:alert] = I18n.t('coupons.invalid')
    end
    redirect_to order_order_items_path
  end

  private

  def coupon_valid?
    Coupon.exists?(code: params.dig(:coupon, :code), active: true)
  end
end
