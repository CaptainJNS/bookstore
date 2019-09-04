require 'rails_helper'

RSpec.describe BookDecorator do
  subject(:book) { FactoryBot.create(:book) }

  it '#authors_names' do
    expect(book.decorate.authors_names).to eq(book.authors.map { |author| author.decorate.full_name }.join(', '))
  end

  it '#categories_names' do
  expect(book.decorate.categories_names).to eq(book.categories.map{ |category| category.name }.join(', '))
  end
end
