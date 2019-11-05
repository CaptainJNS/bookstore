module Application
  extend ActiveSupport::Concern

  included do
    helper_method :current_order
  end

  def current_user
    super&.decorate
  end

  def current_order
    session[:order_id] = Order.create.id unless session[:order_id]
    Order.find_or_create_by(id: session[:order_id]).decorate
  end
end
