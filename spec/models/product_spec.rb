require 'rails_helper'
# bin/rails g rspec:model User

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @mycategory = Category.create name: "recreation"
      @myproduct = Product.create name: 'funproduct',category: @mycategory,
                         price: 120, quantity: 10
    end

    it "should have a name" do
      expect(@myproduct.name).to be_present
    end

    it "should have price" do
      expect(@myproduct.price).to be_present
    end

    it "should have quantity" do
      expect(@myproduct.quantity).to be_present
    end

    it "should have quantity" do
      expect(@myproduct.category).to be_present
    end

    after(:each) do
      @myproduct.destroy
      @mycategory.destroy
    end
  end
end


