require 'rails_helper'

RSpec.describe ReviewDecorator do
  subject(:review) { create(:review, user: create(:user)) }

  it '#to_string' do
    expect(review.decorate.to_string).to eq(I18n.t('book.review') + " \##{review.id}")
  end

  it '#author' do
    expect(review.decorate.author).to eq(review.user.decorate.name)
  end

  it '#date' do
    expect(review.decorate.date).to eq(review.created_at.strftime('%d.%m.%Y'))
  end

  it '#image' do
    expect(review.decorate.image).to eq(review.user.decorate.image)
  end
end
