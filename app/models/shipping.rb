class Shipping < ApplicationRecord
  belongs_to :user

  validates(
    :first_name,
    :last_name,
    :address,
    :city,
    :zip,
    :country,
    :phone,
    presence: false
  )

  validates_format_of :phone, with: /\A(\+\d{1,2}\s)?\(?\d{3}\)?[\s.-]\d{3}[\s.-]\d{4}\z/, allow_blank: true
  validates :zip, numericality: { only_integer: true }, allow_blank: true
end
