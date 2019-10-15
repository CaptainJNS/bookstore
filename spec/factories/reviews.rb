FactoryBot.define do
  factory :review do
    body { FFaker::Lorem.paragraph }
    status { I18n.t('review.unprocessed') }
    user
    book
  end
end
