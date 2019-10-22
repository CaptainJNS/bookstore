FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    confirmed_at { Time.zone.now }

    trait :addresses do
      billing { Billing.create }
      shipping { Shipping.create }
    end
  end
end
