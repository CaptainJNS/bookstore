CATEGORIES = ['Mobile development', 'Photo', 'Web design', 'Web development'].freeze

FactoryBot.define do
  factory :category do
    name { CATEGORIES.sample }
  end
end
