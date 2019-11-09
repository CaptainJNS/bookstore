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
    when :complete  then complete?
    end
  end

  def delivery?
    @current_user.billing.present?
  end

  def payment?
    @current_order.delivery.present?
  end

  def confirm?
    @current_user.credit_card.present?
  end

  def complete?
    @current_order.status == 'in_delivery'
  end
end
