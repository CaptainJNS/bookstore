class OrderItemsController < ApplicationController
  def index
    result = CalculateDiscount.call(current_order: current_order)
    @discount = result.discount
  end

  def create
    result = CreateOrderItem.call(params: order_item_params, current_order: current_order)

    if result.success?
      redirect_to order_order_items_path, notice: I18n.t('order.added')
    else
      redirect_to order_order_items_path, alert: I18n.t('order.wrong')
    end
  end

  def destroy
    result = DestroyOrderItem.call(order_item_id: params[:id], current_order: current_order)

    if result.success?
      redirect_to order_order_items_path, notice: I18n.t('order.deleted')
    else
      redirect_to order_order_items_path, alert: I18n.t('order.wrong')
    end
  end

  private

  def order_item_params
    params.permit(%i[book_id quantity order_id])
  end
end
