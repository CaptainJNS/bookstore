class OrderDecorator < ApplicationDecorator
  delegate_all

  decorates_association :order_items

  def sub_price
    order_items.sum(&:price)
  end

  def discount(price = nil)
    return Constants::ZERO unless coupon

    price ||= sub_price
    price * coupon.discount / Constants::HUNDRED
  end

  def number
    "Order \##{id}"
  end

  def status_to_s
    I18n.t("order.statuses.#{status}")
  end
end
