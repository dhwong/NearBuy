
10.times do |i|
  Widget.create!(title: "#{i}", content: "Content #{i}")
end


# Create Users

User.create(email: "jimmy_boy@hotmail.com", fname: "Jimmy", lname: "Cunningham",
			password: "jimmy", isOwner: true)

User.create(email: "sarah.crawford@GMAIL.com", fname: "Sarah", lname: "Crawford",
			password: "sandwich", isOwner: true)

User.create(email: "itsGilbertYo@yahoo.com", fname: "Gilbert", lname: "Schmidt",
			password: "12345abc", isOwner: true)


# Create Stores

Store.create(owner: User.find_by(email: "jimmy_boy@hotmail.com"), name: "Jimmy's Book Store",
			location: "Dallas", store_type: "bookstore")

Store.create(owner: User.find_by(email: "sarah.crawford@gmail.com"), name: "Sarah's Book Store",
			location: "Dallas", store_type: "bookstore")

Store.create(owner: User.find_by(email: "itsgilbertyo@yahoo.com"), name: "Gilbert's Book Store",
			location: "Dallas", store_type: "bookstore")



# Create Items and Inventory

3.times do |i|
	10.times do |j|
		idx = (i)*10 + j + 1
		Item.create(name: "Book #{idx}", category: "books")

		if i == 0
			store = Store.find_by(name: "Jimmy's Book Store")
		elsif i == 1
			store = Store.find_by(name: "Sarah's Book Store")
		elsif i == 2
			store == Store.find_by(name: "Gilbert's Book Store")
		end

		InventoryItem.create(store: store, item: Item.find_by(name: "Book #{idx}"),
							price_in_cents: 1599, in_stock: 10)
	end
end

