FactoryBot.define do
  factory :shipping do
    first_name { FFaker::Name.first_name }
    last_name { FFaker::Name.last_name }
    address { FFaker::Address.street_address }
    city { FFaker::Address.city }
    zip { FFaker::AddressUS.zip_code.to_i }
    country { FFaker::Address.country }
    phone { rand(10000000000..99999999999).to_s }
    # user { nil }
  end
end
