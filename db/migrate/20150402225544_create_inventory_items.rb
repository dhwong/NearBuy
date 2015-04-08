class CreateInventoryItems < ActiveRecord::Migration
  def change
    create_table :inventory_items do |t|
      t.integer :store_id
      t.integer :item_id
      t.integer :price_in_cents
      t.integer :in_stock

      t.timestamps
    end
  end
end
