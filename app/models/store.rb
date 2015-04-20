class Store < ActiveRecord::Base
	belongs_to :owner, :class_name => "User"
	has_many :inventory_items
	has_many :items, through: :inventory_items
	validates :name, presence: true, uniqueness: true, length: { maximum: 63 }

	searchable do
		latlon(:location) { Sunspot::Util::Coordinates.new(lat, lon) }
		
	end
end
