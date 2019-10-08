class UsersController < ApplicationController
  def settings
    @billing = user_billing
    @shipping = user_shipping
    @email = current_user.email
  end

  def update_billing
    current_user.billing.update(address_params(:billing))
  end

  def update_shipping
    current_user.shipping.update(address_params(:shipping))
  end

  def update_email
    current_user.update(email)
    # binding.pry
    # current_user.save
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

  def email
    params.require(:email).permit(:email)
  end

  def user_billing
    current_user.billing ||= Billing.new
  end

  def user_shipping
    current_user.shipping ||= Shipping.new
  end
end
