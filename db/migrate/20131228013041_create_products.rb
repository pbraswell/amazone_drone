class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.integer :price
      t.string :image_file
      t.belongs_to :order
      t.timestamps
    end
  end
end
