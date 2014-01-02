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

# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :delivery_details do
    name "Joe Customer"
    latitude 37.389555540640075
    longitude -77.71055472573725
  end
end
