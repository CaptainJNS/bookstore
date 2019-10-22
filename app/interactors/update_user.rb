class UpdateUser
  include Interactor

  def call
    @params = context.permitted_params
    @user = context.current_user

    update_address
    @user.update_without_password(@params) if @params[:email]
    if @params[:current_password]
      context.fail! unless @user.update_with_password(@params)
    end
  rescue
    context.fail!
  end

  private

  def update_address
    return @user.billing.update(@params[:billing]) if @params[:billing]

    return @user.shipping.update(@params[:shipping]) if @params[:shipping]
  end
end
