MATERIALS = ['glossy paper', 'hardcover', 'soft paper', 'cardboard'].map(&:capitalize!).freeze
DIMENSION = (1.0..10.0).freeze

FactoryBot.define do
  factory :book do
    title { FFaker::Book.unique.title }
    description { FFaker::Book.description }
    price {rand(5.0..500.00)}
    quantity {rand(1..100)}
    dimensions {"#{rand(DIMENSION).round(1)}\"x#{rand(DIMENSION).round(1)}\"x#{rand(DIMENSION).round(1)}\""}
    year {rand(1666..2019)}
    materials {MATERIALS.sample(rand(1..3)).join(', ')}
    categories { create_list(:category, 1) }
    authors { create_list(:author, 2) }
  end
end
