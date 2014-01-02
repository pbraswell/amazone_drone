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
  factory :delivery_detail, :class => 'DeliveryDetails' do
    name "MyString"
    latitude 1.5
    longitude 1.5
    order_id 1
  end
end
