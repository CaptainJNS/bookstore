module CheckoutShow
  extend ActiveSupport::Concern

  included do
    private

    def show_address
      @billing_builder = Billing.find_or_initialize_by(user: current_user)
      render_wizard
    end

    def show_delivery
      @deliveries = Delivery.all
      render_wizard
    end

    def show_payment
      @credit_card = CreditCard.find_or_create_by(user: current_user)
      render_wizard
    end

    def show_confirm
      render_wizard
    end

    def show_complete
      render_wizard
      OrderConfirmationMailer.with(user: current_user).order_confirmation.deliver_now
      session[:order_id] = nil
    end
  end
end
