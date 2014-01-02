class CreateDeliveryDetails < ActiveRecord::Migration
  def change
    create_table :delivery_details do |t|
      t.string :name
      t.float :latitude
      t.float :longitude
      t.belongs_to :order
      t.timestamps
    end
  end
end
