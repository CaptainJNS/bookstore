class CheckoutsController < ApplicationController
  include Wicked::Wizard
  include CheckoutHelper

  before_action :checkout_validation
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

  def fast_authenticate_user!
    redirect_to new_fast_registration_path unless current_user
  end

  def initialize_checkout_user
    current_order.update(user: current_user)
  end

  def check_order_items
    redirect_to(root_path, alert: I18n.t('order.no_items')) unless current_order.order_items.any?
  end

  def check_step
    redirect_to checkout_path(@previous_step) unless CheckoutValidator.new(current_order, current_user, step).step_allowed?
  end

  def checkout_validation
    fast_authenticate_user!
    initialize_checkout_user
    check_order_items
    check_step
  end
end
