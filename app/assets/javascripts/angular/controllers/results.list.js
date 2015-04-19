app.controller('ResultsListController', ['$scope', 'Restangular', function($scope, Restangular) {
	
  // Get the stores
  Restangular.all("stores").getList().then(function(stores) {
  	$scope.stores = stores;
	  // Get the relations
	  Restangular.all("inventory_items").getList().then(function(inventory_items) {

	 		// Get the items list json
	 		Restangular.all("items").getList().then(function(items) {
	 			$scope.items = items;
	 		});

	 		// Concatinate item list (?)  This is wrong.
	 		$scope.inventory_items = inventory_items;
		  Restangular.all("items").getList().then(function(items) {
		  	count = 0;
		   	var concatItems = [];
		  	for (var item in items) {
		  		try {
		  			item.price = inventory_items[count].price_in_cents;
		  			item.stock = inventory_items[count].in_stock;
		  			item.store = stores[ inventory_items[count].store_id - 1].name;
		  			concatItems.push(item);
		  			count += 1;
		  		}
		  		catch(e) {
		  			consol.log('error');
		  			$items2 = concatItems;
		  		}
		  	}
		  	console.log($items);
		  });

	  });
  });

}]);