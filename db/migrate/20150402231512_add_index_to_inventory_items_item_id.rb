class AddIndexToInventoryItemsItemId < ActiveRecord::Migration
  def change
  	add_index :inventory_items, :item_id
  	add_index :inventory_items, :store_id
  end
end
