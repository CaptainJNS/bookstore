require 'rails_helper'

RSpec.describe AuthorDecorator do
  subject(:author) { FactoryBot.create(:author) }

  it '#full_name' do
    expect(author.decorate.full_name).to eq("#{author.first_name} #{author.last_name}")
  end
end
