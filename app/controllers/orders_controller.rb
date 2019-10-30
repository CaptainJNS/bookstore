class OrdersController < ApplicationController
  def update
    if coupon_valid?
      current_order.update(coupon: Coupon.find_by(code: params[:coupon][:code]))
      flash[:notice] = 'Coupon attached!'
    else
      flash[:alert] = 'You\'ve entered invalid coupon code'
    end
    redirect_to order_order_items_path(current_order)
  end

  private

  def coupon_valid?
    Coupon.find_by(code: params[:coupon][:code]).active
  rescue
    false
  end
end
