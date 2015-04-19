APP.controller('indexCtrl', ['$scope', 'Restangular', function($scope, Restangular){

	$scope.create = function(user){
		Restangular.all("users").post({ "user": user });
	}
}]);