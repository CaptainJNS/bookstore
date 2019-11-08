class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include Checkout

  before_action :fast_authenticate_user!, :initialize_checkout_user, :check_order_items, :check_step
  steps :address, :delivery, :payment, :confirm, :complete

  def show
    case step
    when :address   then address
    when :delivery  then delivery
    when :payment   then payment
    when :confirm   then confirm
    when :complete  then complete
    end
  end

  def update
    case step
    when :address   then update_address
    when :delivery  then update_delivery
    when :payment   then update_payment
    when :confirm   then finalize_order
    end
  end

  private

  def address
    current_order.update(status: :in_progress)
    @billing_builder = current_user.billing.nil? ? Billing.new : nil
    render_wizard
  end

  def update_address
    render_wizard current_order if current_user.update(address_params)
  end

  def delivery
    @deliveries = Delivery.all
    render_wizard
  end

  def update_delivery
    result = AddDelivery.call(current_order: current_order, delivery_id: params[:order][:delivery_id])
    render_wizard current_order if result.success?
  end

  def payment
    @credit_card = CreditCard.where(user: current_user).first_or_create
    render_wizard
  end

  def update_payment
    render_wizard current_order if current_user.update(card_params)
  end

  def confirm
    render_wizard
  end

  def finalize_order
    current_order.update(status: :in_delivery)
    render_wizard current_order
  end

  def complete
    render_wizard
    current_order.coupon.update(active: false) if current_order.coupon.present?
    OrderConfirmationMailer.with(user: current_user).order_confirmation.deliver_now
    session[:order_id] = nil
  end

  def card_params
    params.require(:user).permit(credit_card_attributes: %i[number card_name cvv expiration_date])
  end

  def address_params
    params.require(:user).permit(billing_attributes: %i[first_name last_name address city zip country phone])
  end
end
