class Book < ApplicationRecord
  has_and_belongs_to_many :authors
  has_and_belongs_to_many :categories
  has_many_attached :images

  validates :title, :description, :price, :year, :quantity, presence: true

  validates :price, numericality: { greater_or_equal_to: 0, less_than_or_equal_to: 100_000 }
  validates :quantity, numericality: { only_integer: true, greater_or_equal_to: 0 }

  scope :most_recent,      -> { order('created_at DESC') }

  scope :ascending_title,  -> { order('title ASC') }
  scope :descending_title, -> { order('title DESC') }

  scope :ascending_price,  -> { order('price ASC') }
  scope :descending_price, -> { order('price DESC') }
end
