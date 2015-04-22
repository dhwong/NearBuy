app.controller('ResultsListController', ['$scope', 'Restangular', 'Query', function($scope, Restangular, Query) {
  $scope.Query = Query;
  Restangular.all("stores").getList().then(function(stores) {
  		// Get the items list json
	 		Restangular.all("items").getList().then(function(items) {
	 			$scope.items = items;
	 		});
  });
}]);