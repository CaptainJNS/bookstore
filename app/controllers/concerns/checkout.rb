module Checkout
  extend ActiveSupport::Concern

  included do
    def fast_authenticate_user!
      redirect_to users_fast_new_path unless current_user
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
  end
end
