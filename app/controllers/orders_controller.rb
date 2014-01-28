class OrdersController < ApplicationController
  def new
  	@order = Order.new
  	@order.delivery_details = DeliveryDetails.new
  	@product = Product.find params[:product_id]
  end

  def create
    session[:return_to] ||= request.referer
    @order = Order.process_order params 
    respond_to do |format|
    	format.xml {render :xml => @order}
    	format.json {render :json => @order}
      format.html {redirect_to session[:return_to] ||= request.referer, :notice => "Network created."}
    end
  end

  def update
  end

end
