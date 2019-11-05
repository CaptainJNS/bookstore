class CheckoutValidator
  def initialize(current_order, current_user, step)
    @current_order = current_order
    @current_user = current_user
    @step = step
  end

  def step_allowed?
    case @step
    when :address   then true
    when :delivery  then delivery?
    when :payment   then payment?
    when :confirm   then confirm?
    when :complete  then true
    end
  end

  def delivery?
    @current_user.billing || @current_order.shipping
  end

  def payment?
    @current_order.delivery.present?
  end

  def confirm?
    @current_user.credit_card.present?
  end
end
