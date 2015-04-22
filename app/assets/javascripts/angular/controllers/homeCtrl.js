app.controller('homeController', ['$scope', 'Query', function($scope, Query) {

	// Use Query factory to pass user query between states
	$scope.Query = Query;
}]);