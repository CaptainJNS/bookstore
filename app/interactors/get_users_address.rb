class GetUsersAddress
  include Interactor

  def call
    context.object = context.address == :billing ? Billing.where(user: context.user).first_or_create : Shipping.where(user: context.user).first_or_create
  end
end
