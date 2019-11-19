class Order < ApplicationRecord
  has_many :order_items, dependent: :destroy
  has_many :books, through: :order_items
  has_one :coupon, dependent: :nullify

  enum status: %i[created in_progress in_delivery delivered canceled]
end
