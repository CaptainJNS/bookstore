class ApplicationController < ActionController::Base
  before_action :set_order

  helper_method :current_order

  def current_user
    super&.decorate
  end

  def set_order
    session[:order_id] = Order.find_or_create_by(id: session[:order_id]).id
    session[:order_items_count] = Order.find(session[:order_id]).order_items.count
  end

  def current_order
    Order.find(session[:order_id]).decorate
  end
end
