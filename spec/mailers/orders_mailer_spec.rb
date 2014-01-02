require "spec_helper"

describe OrdersMailer do
  include EmailSpec::Helpers
  include EmailSpec::Matchers

  let(:order) {FactoryGirl.create :order}	
  before(:all) do
    @email = OrdersMailer.mission_email(order)
  end

  it "should have a subject" do 
    @email.should have_subject("Drone Mission")
  end

  it "should contain the proper logitude and latitude" do
  	@email.to_s.include? "Longitude: #{order.delivery_details.longitude}"
  	@email.to_s.include? "Latitude: #{order.delivery_details.latitude}"
  end

  it "should contain the product order information " do
  	@email.to_s.include? "Product: #{"1969 Corvette"}"
  end

end
