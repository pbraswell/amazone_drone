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

    delegate :name, :latitude, :logitude, :to => :delivery_details
end
