class Store < ActiveRecord::Base
	belongs_to :owner, :class_name => "User"
	has_many :inventory_items
	has_many :items, through: :inventory_items
	validates :name, presence: true, uniqueness: true, length: { maximum: 63 }

	geocoded_by :address
	after_validation :geocode, :if => :address_changed?

	searchable do
		text :name
		double :longitude
		double :latitude
		location(:location) { Sunspot::Util::Coordinates.new(latitude,longitude) }
	end
end
