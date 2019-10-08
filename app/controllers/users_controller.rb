class UsersController < ApplicationController
  def settings
    @billing = user_billing
    @shipping = user_shipping
  end

  def update_billing
    current_user.billing.update(address_params(:billing))
  end

  def update_shipping
    current_user.shipping.update(address_params(:shipping))
  end

  private

  def address_params(parameter)
    params.require(parameter).permit(
      :first_name,
      :last_name,
      :address,
      :city,
      :zip,
      :country,
      :phone
    )
  end

  def user_billing
    current_user.billing ||= Billing.new
  end

  def user_shipping
    current_user.shipping ||= Shipping.new
  end
end
