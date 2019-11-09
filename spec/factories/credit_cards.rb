FactoryBot.define do
  factory :credit_card do
    card_name { FFaker::Lorem.word }
    number { rand(10).to_s * 16 }
    cvv { rand(10).to_s * 3 }
    expiration_date { "#{rand(10..12)}/#{rand(20..30)}" }
  end
end
