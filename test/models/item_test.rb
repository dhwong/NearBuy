require "test_helper"

class ItemTest < ActiveSupport::TestCase

	def setup
		@item = Item.new(name: "Example Item", category: "Test Category",
						 brand: "Example Brand")
	end

	test "should be valid" do
		assert @item.valid?
	end

	test "name should not be too long" do
		@item.name = "a" * 256
		assert_not @item.valid?
	end

	test "category should not be too long" do
		@item.category = "a" * 256
		assert_not @item.valid?
	end

	test "brand should not be too long" do
		@item.brand = "a" * 256
		assert_not @item.valid?
	end

	test "name should not be blank"
		@item.name = "     "
		assert_not @item.valid?
	end

	test "item name should be unique" do
		duplicate_item = @item.dup
		@item.save
		assert_not duplicate_item.valid?
	end

end