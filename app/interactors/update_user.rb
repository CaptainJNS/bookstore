class UpdateUser
  include Interactor

  def call
    @params = context.permitted_params
    @user = context.current_user

    return if update_address

    return if @params[:email] && @user.update_without_password(@params)

    return if @params[:current_password] && @user.update_with_password(@params)

    context.fail!
  end

  private

  def update_address
    return @user.billing.update(@params[:billing]) if @params[:billing]

    return @user.shipping.update(@params[:shipping]) if @params[:shipping]
  end
end
