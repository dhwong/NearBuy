app.controller('ResultsListController', ['$scope', 'Restangular', 'Query', 'apiaryFactory',
	function($scope, Restangular, Query) {

  	$scope.Query = Query;
  	$scope.results = {};

  	// Get using the existing simplified GET all on the items collection
	 	Restangular.all("items").getList().then(function(items) {
	 		$scope.items = items;
	 	});

	 	// Query apiary results page
	 	$scope.postSearch = function(query) {
	 		apiaryFactory.postSearch(query)
	 		  .success(function() {
	 		  	$scope.results = Query;
	 		  })
	 		  .error(function() {
	 		  	alert('Apiary post unsuccesful');
	 		  });
	 	};


}]);