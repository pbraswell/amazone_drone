# == Schema Information
#
# Table name: delivery_details
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  latitude   :float
#  longitude  :float
#  order_id   :integer
#  created_at :datetime
#  updated_at :datetime
#

class DeliveryDetails < ActiveRecord::Base
end
