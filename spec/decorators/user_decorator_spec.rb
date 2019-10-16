require 'rails_helper'

RSpec.describe UserDecorator do
  subject(:user) { create(:user) }

  it '#name' do
    expect(user.decorate.name).to eq(user.name)
  end

  it '#image' do
    expect(user.decorate.image).to eq(Constants::NO_IMAGE_PATH)
  end
end
