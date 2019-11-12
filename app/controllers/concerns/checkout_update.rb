module CheckoutUpdate
  extend ActiveSupport::Concern

  included do
    private

    def update_address
      redirect_to checkout_path(undone_step) if current_user.update(address_params)
    end

    def update_delivery
      result = AddDelivery.call(current_order: current_order, delivery_id: params[:order][:delivery_id])
      redirect_to checkout_path(undone_step) if result.success?
    end

    def update_payment
      redirect_to checkout_path(undone_step) if current_user.update(card_params)
    end

    def finalize_order
      current_order.update(status: :in_delivery)
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
      params.require(:user).permit(billing_attributes: %i[first_name last_name address city zip country phone])
    end
  end
end
