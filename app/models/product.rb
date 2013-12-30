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

class Product < ActiveRecord::Base
	validates :name, presence: true
	validates :image_file, presence: true
	validates_numericality_of :price, :greater_than => 0
end
