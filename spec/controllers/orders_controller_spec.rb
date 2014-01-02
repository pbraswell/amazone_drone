require 'spec_helper'

describe OrdersController do
  let(:product) {FactoryGirl.create :product}
  let(:valid_attributes) { { "product_id" => product.id } }
  let(:valid_session) { {} }

  describe "with valid params" do
    it "creates a new order" do
      expect {
        post :create, {:order => valid_attributes, :format => 'json'}, valid_session
      }.to change(Order, :count).by(1)
    end

    it "assigns a newly created order as @order" do
      post :create, {:order => valid_attributes, :format => 'json'}, valid_session
      expect(assigns(:order)).to be_a(Order)
      expect(assigns(:order)).to be_persisted
    end

  end

end
