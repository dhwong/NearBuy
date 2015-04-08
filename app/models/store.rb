class Store < ActiveRecord::Base
	belongs_to :owner, :class_name => "User"
	has_many :inventory_items
	validates :name, presence: true, uniqueness: true, length: { maximum: 63 }
end
