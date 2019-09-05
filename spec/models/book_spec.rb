require 'rails_helper'

RSpec.describe Book, type: :model do
  context 'validation' do
    it 'is invalid without title' do
      expect(FactoryBot.build(:book, title: nil)).not_to be_valid
    end

    it 'is invalid without description' do
      expect(FactoryBot.build(:book, description: nil)).not_to be_valid
    end

    it 'is invalid without price' do
      expect(FactoryBot.build(:book, price: nil)).not_to be_valid
    end

    it 'is invalid without year' do
      expect(FactoryBot.build(:book, year: nil)).not_to be_valid
    end

    it 'is invalid without quantity' do
      expect(FactoryBot.build(:book, quantity: nil)).not_to be_valid
    end

    it 'is invalid with incorrect price' do
      expect(FactoryBot.build(:book, price: 0)).not_to be_valid
      expect(FactoryBot.build(:book, price: -1)).not_to be_valid
      expect(FactoryBot.build(:book, price: 100_001)).not_to be_valid
      expect(FactoryBot.build(:book, price: 'price')).not_to be_valid
    end

    it 'is valid with correct price' do
      expect(FactoryBot.build(:book, price: 23)).to be_valid
    end

    it 'is invalid with incorrect quantity' do
      expect(FactoryBot.build(:book, quantity: 1.5)).not_to be_valid
      expect(FactoryBot.build(:book, quantity: -1)).not_to be_valid
      expect(FactoryBot.build(:book, quantity: 'quantity')).not_to be_valid
    end

    it 'is valid with correct quantity' do
      expect(FactoryBot.build(:book, quantity: 0)).to be_valid
      expect(FactoryBot.build(:book, quantity: 23)).to be_valid
    end
  end

  context 'associations' do
    let(:book) { FactoryBot.create :book }

    it 'has many authors' do
      expect(book).to respond_to :authors
    end

    it 'has many images' do
      expect(book).to respond_to :images
    end

    it 'has many categories' do
      expect(book).to respond_to :categories
    end
  end
end
