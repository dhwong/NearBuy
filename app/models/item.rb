class Item < ActiveRecord::Base
	has_many :inventory_items
	validates :name, presence: true, length: { maximum: 255 },
					 uniqueness: true
	validates :category, presence: true, length: { maximum: 255 }
	validates :brand, presence: true, length: { maximum: 255 }
end
