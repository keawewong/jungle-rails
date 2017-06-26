require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'validations' do
    it "enter example to test db input" do
      @category = Category.find_or_create_by(name: "dank")
      @product = @category.products.find_or_create_by(name: "test", price_cents: 100, quantity: "3", category_id: 1)
      expect(@product).to be_valid
    end

    it "validates name" do
      @category = Category.find_or_create_by(name: "dank")
      @product = @category.products.find_or_create_by(name: "cool product", price_cents: 100, quantity: "3", category_id: 1)
      expect(@product.name).not_to be_nil
    end

    it "validates price" do
      @category = Category.find_or_create_by(name: "danks")
      @product = @category.products.find_or_create_by(name: "epic", price_cents: 100, quantity: "3", category_id: 1)
      expect(@product.price).not_to be_nil
    end

    it "validates category" do
      @category = Category.find_or_create_by(name: "SO LIT")
      @product = @category.products.find_or_create_by(name: "epic", price_cents: 100, quantity: "3", category_id: 3)
      expect(@product.category).not_to be_nil
    end
  end
end
