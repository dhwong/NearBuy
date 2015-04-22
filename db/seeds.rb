
10.times do |i|
  Widget.create!(title: "#{i}", content: "Content #{i}")
end


# Create Users

User.create(email: "jimmy_boy@hotmail.com", fname: "Jimmy", lname: "Cunningham",
			password: "jimmy", password_confirmation: "jimmy", isOwner: true)

User.create(email: "sarah.crawford@GMAIL.com", fname: "Sarah", lname: "Crawford",
			password: "sandwich", password_confirmation: "sandwich", isOwner: true)

User.create(email: "itsGilbertYo@yahoo.com", fname: "Gilbert", lname: "Schmidt",
			password: "12345abc", password_confirmation: "12345abc", isOwner: true)

User.create(email: "samwise_gangy@hobbit.com", fname: "Samwise", lname: "Gangy",
			password: "ilovefrodo", password_confirmation: "ilovefrodo", isOwner: false)

User.create(email: "yoyoyo_itsfrodo@hobbit.com", fname: "Frodo", lname: "Baggins",
			password: "samisannoying", password_confirmation: "samisannoying", isOwner: false)

User.create(email: "manager@walmart.com", fname: "General", lname: "Manager",
			password: "walmart", password_confirmation: "walmart", isOwner: true)


# Create Stores

Store.create(owner: User.find_by(email: "jimmy_boy@hotmail.com"), name: "Jimmy's Book Store",
			address: "4444 Worcola St., Dallas, TX, 75205", store_type: "bookstore")

Store.create(owner: User.find_by(email: "sarah.crawford@gmail.com"), name: "Sarah's Book Store",
			address: "10600 Preston Rd., Dallas, TX", store_type: "bookstore")

Store.create(owner: User.find_by(email: "itsgilbertyo@yahoo.com"), name: "Gilbert's Book Store",
			address: "1392 Sesame St., Dallas, TX, 75206", store_type: "bookstore")

Store.create(owner: User.find_by(email: "manager@walmart.com"), name: "Walmart Superstore",
			address: "1234 Greenville Ave., Dallas, TX, 75230", store_type: "general")

Store.create(owner: User.find_by(email: "sarah.crawford@gmail.com"), name: "7-11",
			address: "8888 Hillcrest Ave., Dallas, TX, 75203", store_type: "gas station")



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
			store = Store.find_by(name: "Gilbert's Book Store")
		end

		InventoryItem.create(store: store, item: Item.find_by(name: "Book #{idx}"),
							price_in_cents: 1599, in_stock: 10)
	end
end

Item.create(name: "32-bit drill", category: "tools", brand: "Smith Tools")
Item.create(name: "hammer", category: "tools", brand: "Smith Tools")
Item.create(name: "wrench", category: "tools", brand: "Smith Tools")
Item.create(name: "screwdriver", category: "tools", brand: "Taylor Tools")
Item.create(name: "jackhammer", category: "tools", brand: "Taylor Tools")
Item.create(name: "swimsuit", category: "clothes", brand: "Volcom")
Item.create(name: "sunglasses", category: "accessories", brand: "Ray Ban")
Item.create(name: "Nike AirMax 3000", category: "shoes", brand: "Nike")
Item.create(name: "size 32 blue jeans", category: "clothes", brand: "Smith Tools")
Item.create(name: "Harry Potter and the Sorcerer's Stone", category: "books", brand: "JK Rowling")
Item.create(name: "Harry Potter and the Chamber of Secrets", category: "books", brand: "JK Rowling")
Item.create(name: "Harry Potter and the Prisoner of Azkaban", category: "books", brand: "JK Rowling")
Item.create(name: "Harry Potter and the Goblet of Fire", category: "books", brand: "JK Rowling")
Item.create(name: "Harry Potter and the Order of the Phoenix", category: "books", brand: "JK Rowling")
Item.create(name: "Harry Potter and the Half-Blood Prince", category: "books", brand: "JK Rowling")
Item.create(name: "Harry Potter and the Deathly Hallows", category: "books", brand: "JK Rowling")


InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "32-bit drill"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "hammer"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "wrench"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "screwdriver"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "jackhammer"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "swimsuit"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "7-11"),
					item: Item.find_by(name: "sunglasses"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "size 32 blue jeans"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "Nike AirMax 3000"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Jimmy's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Sorcerer's Stone"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Sarah's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Sorcerer's Stone"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Gilbert's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Chamber of Secrets"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Jimmy's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Chamber of Secrets"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Sarah's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Prisoner of Azkaban"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Gilbert's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Prisoner of Azkaban"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Jimmy's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Goblet of Fire"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "Harry Potter and the Goblet of Fire"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Gilbert's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Order of the Phoenix"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Sarah's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Order of the Phoenix"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Gilbert's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Half-Blood Prince"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Jimmy's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Half-Blood Prince"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Walmart Superstore"),
					item: Item.find_by(name: "Harry Potter and the Deathly Hallows"),
					price_in_cents: 3450, in_stock: 50)
InventoryItem.create(store: Store.find_by(name: "Jimmy's Book Store"),
					item: Item.find_by(name: "Harry Potter and the Deathly Hallows"),
					price_in_cents: 3450, in_stock: 50)

