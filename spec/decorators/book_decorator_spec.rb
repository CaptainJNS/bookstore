require 'rails_helper'

RSpec.describe BookDecorator do
  subject(:decorator) { described_class.new(book) }

  let(:book) { create(:book) }

  it '#authors_names' do
    expect(decorator.authors_names).to eq(book.authors.map { |author| author.decorate.full_name }.join(', '))
  end

  it '#categories_names' do
    expect(decorator.categories_names).to eq(book.categories.map(&:name).join(', '))
  end

  it '#cover' do
    expect(decorator.cover).to eq(book.images[0])
  end
end
