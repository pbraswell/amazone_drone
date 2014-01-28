# == Schema Information
#
# Table name: orders
#
#  id         :integer          not null, primary key
#  created_at :datetime
#  updated_at :datetime
#

class Order < ActiveRecord::Base
	# only one product to an order because of 
	# the physical limitations of the delivery 
	# vehicle
	has_one :product
    has_one :delivery_details

    delegate :name, :latitude, :longitude, :to => :delivery_details

    def self.process_order params
        product_id = params[:product_id].nil? ? params[:order][:product_id] : params[:product_id]
	  	product = Product.find product_id
	  	order = Order.create :product => product
	  	order.product = product
	  	order.delivery_details = DeliveryDetails.create :name => params[:name],
	  	 :longitude => params[:longitude], :latitude => params[:latitude]	
	    if order.save!
	    	OrdersMailer.mission_email(order).deliver()
	    end
	    order
    end

end
