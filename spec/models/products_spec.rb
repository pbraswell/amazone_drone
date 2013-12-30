require 'spec_helper'

describe Product do
  let(:product) {FactoryGirl.create :product}

  describe "Attributes" do
  	it "should have a name attribute" do
      product.should respond_to :name
    end

    it "should have a price attribute" do
      product.should respond_to :price
    end

    it "should have an image file name attribute" do
      product.should respond_to :image_file
    end
  end

  describe "Validations" do
  	it "should be invalid if there is no name" do
  	  product.name = nil
  	  product.should_not be_valid
  	end

    it "should be invalid if there is no price" do
      product.price = 0
      product.should_not be_valid
    end

    it "should be invalid if there is no image file" do
      product.image_file = nil
      product.should_not be_valid
    end
  end

end
