require 'rails_helper'

# Only need to test name, price, quantity and category as they are in the products model (app/models/products)
# with validates which means a row MUST have these to be inserted into the table.
# validates :name, presence: true
# validates :price, presence: true       <------price_cents is converted to this
# validates :quantity, presence: true
# validates :category, presence: true    <------category column is automagically inserted at the column_id column

RSpec.describe Product, type: :model do
  describe 'Validations' do
    context "Given correct fields and values" do
      xit "creates a product" do
        category = Category.create(name: "testCategory")
        product = Product.create(name: "test1", price_cents: 100, quantity: 10, category: category) #category column is equal to the category object.(automagic with active record joining categories and products)
        expect(product).to be_valid
        expect(product.errors.full_messages).to eq([]) #Verify the error messages array. Every test has one, and if no errors it will be empty
      end
    end
    context "Given correct fields and values except for name" do
      xit "does not create a product" do
        category = Category.create(name: "testCategory")
        product = Product.create(name: nil, price_cents: 100, quantity: 10, category: category)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to eq(["Name can't be blank"])
      end
    end
    context "Given correct fields and values except for price" do
      xit "does not create a product" do
        category = Category.create(name: "testCategory")
        product = Product.create(name: "test1", price_cents: nil, quantity: 10, category: category)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to eq(["Price cents is not a number", "Price is not a number", "Price can't be blank"])
      end
    end
    context "Given correct fields and values except for quantity" do
      xit "does not creates a product" do
        category = Category.create(name: "testCategory")
        product = Product.create(name: "test1", price_cents: 100, quantity: nil, category: category)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to eq(["Quantity can't be blank"])
      end
    end
    context "Given correct fields and values except for category" do
      xit "does not creates a product" do
        category = Category.create(name: "testCategory")
        product = Product.create(name: "test1", price_cents: 100, quantity: 10, category: nil)
        expect(product).not_to be_valid
        expect(product.errors.full_messages).to eq(["Category can't be blank"])
      end
    end
  end
end