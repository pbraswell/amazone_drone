require 'spec_helper'

describe OrdersController do
  let(:product) {FactoryGirl.create :product}
  let(:name) {"Joe Customer"}
  let(:longitude) {-77.71055472573725}
  let(:latitude) {37.389555540640075}
  let(:valid_session) { {} }

  describe "with valid params" do
    it "creates a new order" do
      expect {
        post :create, {:name => name, 
                       :product_id => product.id, 
                       :format => 'json'}, valid_session
      }.to change(Order, :count).by(1)
    end

    it "assigns a newly created order as @order" do
      post :create, {:name => name, 
                     :product_id => product.id, 
                     :format => 'json'}, valid_session
      expect(assigns(:order)).to be_a(Order)
      expect(assigns(:order)).to be_persisted
    end
  end

  describe "generating a drone mission" do 
    it "should send out an email on successfull order creation" do
      mailer = mock
      mailer.should_receive(:deliver)
      OrdersMailer.should_receive(:mission_email).and_return(mailer)
      post :create, {:name => name,
                     :product_id => product.id,
                     :longitude => longitude,
                     :latitude => latitude,
                     :format => 'json'}, valid_session
    end

    it "should have a drone mission file attached to the email" do 
      pending
    end

  end

end
