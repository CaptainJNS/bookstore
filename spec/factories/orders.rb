FactoryBot.define do
  factory :order do
    trait :order_items do
      order_items
    end

    trait :coupon do
      coupon
    end

    trait :status do
      status
    end
  end
end
