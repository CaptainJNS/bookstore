class UsersController < ApplicationController
  before_action :authenticate_user!

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
  end

  def update_password
    redirect_to root_path if current_user.update_with_password(password_params)
  end

  def destroy_account
    redirect_to root_path, notice: "You've deleted your account." if current_user.destroy
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

  def password_params
    params.require(:new_password).permit(:password, :password_confirmation, :current_password)
  end

  def user_billing
    current_user.billing ||= Billing.new
  end

  def user_shipping
    current_user.shipping ||= Shipping.new
  end
end
