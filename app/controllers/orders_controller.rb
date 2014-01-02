class OrdersController < ApplicationController
  def new
  	@order = Order.new
  	@order.delivery_details = DeliveryDetails.new
  	@product = Product.find params[:product_id]
  end

  def create
  	puts params
  	product = Product.find params[:product_id]
  	@order = Order.create :product => product
  	@order.product = product
  	@order.delivery_details = DeliveryDetails.create :name => params[:name],
  	 :longitude => params[:longitude], :latitude => params[:latitude]
    if @order.save!
      respond_to do |format|
      	format.xml {render :xml => @order}
      	format.json {render :json => @order}
      end
	else
	end	
  end

  def update
  end

end
