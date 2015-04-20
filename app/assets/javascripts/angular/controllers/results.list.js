app.controller('ResultsListController', ['$scope', 'Restangular', function($scope, Restangular) {
  // Get the stores
  Restangular.all("stores").getList().then(function(stores) {
  		// Get the items list json
	 		Restangular.all("items").getList().then(function(items) {
	 			$scope.items = items;
	 		});
  });
}]);