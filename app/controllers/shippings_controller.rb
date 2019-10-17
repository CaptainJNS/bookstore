class ShippingsController < ApplicationController
  include AddressesHelper

  def update
    redirect_after_update(:shipping) if current_user.shipping.update(address_params(:shipping))
  end
end
