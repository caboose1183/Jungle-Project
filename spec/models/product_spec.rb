require 'rails_helper'

RSpec.describe Product, type: :model do

  before (:each) do
    @category = Category.create name: "Test"
     
    @product = Product.create name: "First", price: 25, quantity: 25, category: @category
  end

  describe 'Validations' do
    it 'is valid when validations all pass' do
      expect(@product).to be_valid
    end

    it 'is not valid when name is nil' do
      @product.name = nil
      expect(@product).to_not be_valid
    end

    it 'is not valid when price is nil' do
      @product2 = Product.create name: "First", quantity: 25, category: @category
      expect(@product2).to_not be_valid
    end

    it 'is not valid when quantity is nil' do
      @product.quantity = nil
      expect(@product).to_not be_valid
    end

    it 'is not valid when category is nil' do
      @product.category = nil
      expect(@product).to_not be_valid
    end
  end
end
