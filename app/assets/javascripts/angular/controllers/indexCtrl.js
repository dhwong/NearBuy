app.controller('indexCtrl', ['$scope', 'Restangular', function($scope, Restangular){
  $scope.user = {fname: "", lname: "", password: "", password_confirmation: "", isOwner: false, 
  email: ""};
	$scope.create = function(user){
		Restangular.all("users").post(user);
	}
}]);