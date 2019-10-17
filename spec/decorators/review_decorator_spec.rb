require 'rails_helper'

RSpec.describe ReviewDecorator do
  subject(:decorator) { described_class.new(review) }

  let(:review) { create(:review, user: create(:user)) }

  it '#to_string' do
    expect(decorator.to_string).to eq(I18n.t('book.review') + " \##{review.id}")
  end

  it '#author' do
    expect(decorator.author).to eq(review.user.decorate.name)
  end

  it '#date' do
    expect(decorator.date).to eq(review.created_at.strftime('%d.%m.%Y'))
  end

  it '#image' do
    expect(decorator.image).to eq(review.user.decorate.image)
  end
end
