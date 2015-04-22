app.controller('homeController', ['$scope', 'Query', function($scope, Query) {

	// determine location
	// TODO: move this to a $scope function called onclick in the html
	var location;
  navigator.geolocation.getCurrentPosition(showPosition, showError);
  
  function showPosition(position) {
    Query.lat = position.coords.latitude;
   	Query.long = position.coords.longitude;
	}

	// TODO: Make these alerts pop up in a stylized modal instead of ugly generic
	// browser alert.
	function showError(error) {
    switch(error.code) {
    	case error.PERMISSION_DENIED:
        alert('User denied the request for Geolocation.');
        break;
      case error.POSITION_UNAVAILABLE:
        alert('Location information is unavailable.');
        break;
     case error.TIMEOUT:
       alert('The request to get user location timed out.');
        break;
     case error.UNKNOWN_ERROR:
        alert('An unknown error occurred.');
        break;
    }
	}

	// Use Query factory to pass user query between states
	$scope.Query = Query;
}]);