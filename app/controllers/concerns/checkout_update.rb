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
  end
end
