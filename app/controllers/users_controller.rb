class UsersController < ApplicationController
  before_action :authenticate_user!

  def edit
    @billing = Billing.where(user: current_user).first_or_create
    @shipping = Shipping.where(user: current_user).first_or_create
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
    User.find(current_user.id).destroy
  end

  private

  def permitted_params
    params.require(:user).permit(
      :password,
      :current_password,
      :password_confirmation,
      :email,
      billing: %i[first_name last_name address city zip country phone],
      shipping: %i[first_name last_name address city zip country phone]
    )
  end
end
