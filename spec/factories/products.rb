# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  price      :integer
#  image_file :string(255)
#  created_at :datetime
#  updated_at :datetime
#

FactoryGirl.define do
  factory :product do
    name "1969 Corvette"
    price 9
    image_file "/public/images/1969_corvette.jpg"
  end
end
