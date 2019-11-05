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

  def service_params
    {
      current_order: current_order,
      current_user: current_user,
      step: @step
    }
  end

  def address
    current_order.update(status: :in_progress)
    
    @billing_builder = current_user.billing.nil? ? Billing.new : nil
    render_wizard
  end

  def update_address
    current_user.update(address_params)
    render_wizard current_order
  end

  def delivery
    @deliveries = Delivery.all
    render_wizard
  end

  def update_delivery
    render_wizard current_order if current_order.update(params.require(:order).permit(:delivery_id))
  end

  def payment
    @credit_card = CreditCard.where(user: current_user).first_or_create
    render_wizard
  end

  def update_payment
    render_wizard current_order if current_user.update(card_params)
  end

  def confirm
    @discount = current_order.sub_price - current_order.total_price
    render_wizard
  end

  def finalize_order
    render_wizard current_order
  end

  def complete
    current_order.update(status: :in_delivery)
    @discount = current_order.sub_price - current_order.total_price
    render_wizard
  end

  def card_params
    params.require(:user).permit(credit_card_attributes: %i[number card_name cvv expiration_date])
  end

  def address_params
    params.require(:user).permit(billing_attributes: %i[first_name last_name address city zip country phone])
  end
end
