class CreateStores < ActiveRecord::Migration
  def change
    create_table :stores do |t|
      t.integer :owner_id
      t.string :name
      t.string :address
      t.string :store_type
      t.float :latitude
      t.float :longitude

      t.timestamps
    end
  end
end
