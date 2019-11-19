require 'rails_helper'

RSpec.describe ReviewDecorator do
  subject(:decorator) { described_class.new(review) }

  let(:user) { create(:user, name: 'John') }
  let(:review) { create(:review, user: user) }

  it '#to_string' do
    review.id = 1
    expect(decorator.to_string).to eq('Review #1')
  end

  it '#author' do
    expect(decorator.author).to eq('John')
  end

  it '#date' do
    review.created_at = '2019-10-18 00:00:00'
    expect(decorator.date).to eq('18.10.2019')
  end

  it '#image' do
    expect(decorator.image).to eq(review.user.decorate.image)
  end
end
