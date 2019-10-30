class OrdersController < ApplicationController
  def update
    current_order.update(total_price: discount) if coupon_valid?
    redirect_to order_order_items_path(current_order)
  end

  private

  def coupon_valid?
    Coupon.find_by(code: params[:coupon][:code]).active
  rescue
    false
  end

  def discount
    current_order.total_price * Coupon.find_by(code: params[:coupon][:code]).discount / 100
  end
end
