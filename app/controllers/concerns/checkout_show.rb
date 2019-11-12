module CheckoutShow
  extend ActiveSupport::Concern

  included do
    private

    def show_address
      current_order.update(status: :in_progress, user: current_user)
      @billing_builder = Billing.first_or_initialize(user: current_user)
      render_wizard
    end

    def show_delivery
      @deliveries = Delivery.all
      render_wizard
    end

    def show_payment
      @credit_card = CreditCard.where(user: current_user).first_or_create
      render_wizard
    end

    def show_confirm
      render_wizard
    end

    def show_complete
      render_wizard
      current_order.coupon.update(active: false) if current_order.coupon.present?
      OrderConfirmationMailer.with(user: current_user).order_confirmation.deliver_now
      session[:order_id] = nil
    end
  end
end
