class InventoryItem < ActiveRecord::Base
	belongs_to :store
	belongs_to :item
	validates_presence_of :price_in_cents
end
