APP.controller('indexCtrl', ['$scope', 'Restangular', function($scope, Restangular){

  
	$scope.register = function(user){
		Restangular.all("users").post(user);
	}
}]);