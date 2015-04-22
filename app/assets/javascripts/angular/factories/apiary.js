// Apiary factory for interacting with mock endpoints.
app.factory('apiaryFactory', ['$http', function($http) {

	var urlBase = 'http://search.apiblueprint.org/';
	var apiaryFactory = {};

	// docs.nearbuyitemsearch.apiary.io/#reference/searches/searches-collection
	apiaryFactory.postSearch = function(query) {
		return $http.post(urlBase + '/searches', query);
	};

	return apiaryFactory;
}]);