require 'rails_helper'

RSpec.describe AuthorDecorator do
  subject(:decorator) { described_class.new(author) }

  let(:author) { create(:author, first_name: 'John', last_name: 'Doe') }

  it '#full_name' do
    expect(decorator.full_name).to eq('John Doe')
  end
end
