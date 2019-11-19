class OrdersController < ApplicationController
  def update
    result = AddCoupon.call(code: params.dig(:coupon, :code), current_order: current_order)

    if result.success?
      flash[:notice] = I18n.t('coupons.attached')
    else
      flash[:alert] = I18n.t('coupons.invalid')
    end

    redirect_to order_order_items_path(order_id: current_order.id)
  end
end
