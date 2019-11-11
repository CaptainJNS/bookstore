class CheckoutValidator
  def initialize(current_order, current_user, step)
    @current_order = current_order
    @current_user = current_user
    @step = step
  end

  def step_allowed?
    case @step
    when :address   then true
    when :delivery  then @current_user.billing.present?
    when :payment   then @current_order.delivery.present?
    when :confirm   then @current_user.credit_card.present?
    when :complete  then @current_order.status == 'in_delivery'
    end
  end
end
