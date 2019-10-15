FactoryBot.define do
  factory :review do
    body { FFaker::Lorem.paragraph }
    status { I18n.t('review.unprocessed') }
    user
    book
    rating { rand(1..5) }
  end
end
