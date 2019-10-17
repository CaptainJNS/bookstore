require 'rails_helper'

RSpec.describe AuthorDecorator do
  subject(:decorator) { described_class.new(author) }

  let(:author) { create(:author) }

  it '#full_name' do
    expect(decorator.full_name).to eq("#{author.first_name} #{author.last_name}")
  end
end
