module CheckoutUpdate
  extend ActiveSupport::Concern

  included do
    private

    def update_address
      CheckoutService.call(step, order: current_order, user: current_user)
      current_order.update(use_billing: params.dig(:user, :orders, :use_billing))
      redirect_to checkout_path(undone_step) if update_user_addresses
    end

    def update_delivery
      result = AddDelivery.call(current_order: current_order, delivery_id: params.dig(:order, :delivery_id))
      redirect_to checkout_path(undone_step) if result.success?
    end

    def update_payment
      redirect_to checkout_path(undone_step) if current_user.update(card_params)
    end

    def finalize_order
      render_wizard current_order
    end

    def undone_step
      return :delivery if current_order.delivery.nil?

      return :payment if current_user.credit_card.nil?

      :confirm
    end

    def card_params
      params.require(:user).permit(credit_card_attributes: %i[number card_name cvv expiration_date])
    end

    def address_params
      params.require(:user).permit(
        billing_attributes: %i[first_name last_name address city zip country phone],
        shipping_attributes: %i[first_name last_name address city zip country phone]
      )
    end

    def update_user_addresses
      params[:user][:shipping_attributes] = params.dig(:user, :billing_attributes) if current_order.use_billing
      current_user.update(address_params)
    end
  end
end
