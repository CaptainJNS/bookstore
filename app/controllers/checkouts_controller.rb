class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CheckoutShow, CheckoutUpdate

  before_action :checkout_validation
  steps :address, :delivery, :payment, :confirm, :complete

  def show
    case step
    when :address   then show_address
    when :delivery  then show_delivery
    when :payment   then show_payment
    when :confirm   then show_confirm
    when :complete  then show_complete
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

  def checkout_validation
    fast_authenticate_user!
    check_order_items
    check_step
  end

  def fast_authenticate_user!
    redirect_to new_fast_registration_path unless current_user
  end

  def check_order_items
    redirect_to(root_path, alert: I18n.t('order.no_items')) unless current_order.order_items.any?
  end

  def check_step
    redirect_to checkout_path(@previous_step) unless step_allowed?
  end

  def step_allowed?
    case step
    when :address   then true
    when :delivery  then current_user.billing.present?
    when :payment   then current_order.delivery.present?
    when :confirm   then current_user.credit_card.present?
    when :complete  then @previous_step == :confirm
    end
  end
end
