FactoryBot.define do
  factory :user do
    name { FFaker::Name.name }
    email { FFaker::Internet.email }
    password { FFaker::Internet.password }
    confirmed_at { Time.zone.now }
    # billing { create(:billing) }
    # shipping { create(:shipping) }
  end
end
