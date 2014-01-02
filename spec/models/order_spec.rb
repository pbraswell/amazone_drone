# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

require 'spec_helper'

describe Order do
  let(:order) {FactoryGirl.create :order}
  describe "associations" do
    it "should have an order details association" do 
      order.should respond_to :delivery_details
    end

    it "should have an association to a product" do
    	order.should respond_to :product
    end
  end 
end
