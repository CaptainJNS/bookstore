class BillingsController < ApplicationController
  include AddressesHelper

  def update
    redirect_after_update(:billing) if current_user.billing.update(address_params(:billing))
  end
end
