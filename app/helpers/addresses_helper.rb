module AddressesHelper
  def address_params(address_method)
    params.require(address_method).permit(%i[first_name last_name address city zip country phone])
  end

  def redirect_after_update(address_method)
    redirect_to edit_user_registration_path, notice: I18n.t("settings.#{address_method}_updated")
  end
end
