class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @billing = Billing.where(user: current_user).first_or_initialize
    @shipping = Shipping.where(user: current_user).first_or_initialize
  end

  def update
    result = UpdateUser.call(permitted_params: permitted_params, current_user: current_user)

    if result.success?
      redirect_after_update
    else
      render :edit
    end
  end

  private

  def permitted_params
    params.require(:user).permit(
      billing_attributes: %i[first_name last_name address city zip country phone],
      shipping_attributes: %i[first_name last_name address city zip country phone]
    )
  end

  def redirect_after_update
    redirect_to settings_path, notice: I18n.t('settings.address_updated')
  end
end
