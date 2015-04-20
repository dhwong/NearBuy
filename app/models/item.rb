class Item < ActiveRecord::Base
	has_many :inventory_items
	has_many :stores, -> { includes :location }, through: :inventory_items
	validates :name, presence: true, length: { maximum: 255 },
					 uniqueness: true
	validates :category, presence: true, length: { maximum: 255 }
	validates :brand, length: { maximum: 255 }


	searchable do
		text :name, :boost => 5
		text :category
		text :brand
		text :stores do
			stores.map(&:store).compact.join(" ")
		end
	end
end
