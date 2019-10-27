FactoryBot.define do
  factory :order_item do
    book { Book.all.sample || create(:book) }
    order { Order.all.sample || create(:order) }
  end
end
