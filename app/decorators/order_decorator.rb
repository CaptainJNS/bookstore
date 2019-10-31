class OrderDecorator < ApplicationDecorator
  delegate_all

  decorates_association :order_items

  def sub_price
    order_items.sum(&:price)
  end
end
