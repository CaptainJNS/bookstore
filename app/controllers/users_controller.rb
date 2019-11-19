class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @billing_builder = Billing.find_or_initialize_by(user: current_user)
    @shipping_builder = Shipping.find_or_initialize_by(user: current_user)
  end

  def update
    result = UpdateUser.call(permitted_params: permitted_params, current_user: current_user)

    if result.success?
      redirect_to edit_user_path, notice: I18n.t('settings.account_updated')
    else
      redirect_to edit_user_path, alert: I18n.t('settings.errors')
    end
  end

  def destroy
    current_user.destroy
    redirect_to root_path, notice: I18n.t('devise.registrations.destroyed')
  end

  private

  def permitted_params
    params.require(:user).permit(
      :password,
      :current_password,
      :password_confirmation,
      :email,
      billing_attributes: %i[first_name last_name address city zip country phone],
      shipping_attributes: %i[first_name last_name address city zip country phone]
    )
  end
end
