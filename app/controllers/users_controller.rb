class UsersController < ApplicationController
  before_action :authenticate_user!, except: %i[fast_new fast_create fast_login]

  def edit
    @billing_builder = current_user.billing.nil? ? Billing.new : nil
    @shipping_builder = current_user.shipping.nil? ? Shipping.new : nil
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

  def fast_new
  end

  def fast_create
    user = User.new(
      email: params[:user][:email],
      password: Devise.friendly_token.first(Devise.password_length.first)
    )
    user.skip_confirmation!

    if user.save
      sign_in(:user, user)
      user.send_reset_password_instructions
      redirect_to checkout_path(:address)
    else
      redirect_to users_fast_new_path, alert: I18n.t('order.wrong')
    end
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
