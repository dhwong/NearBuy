APP.controller('StoresShowController', ['$scope', 'Restangular', '$stateParams', function($scope, Restangular, $stateParams) {
  Restangular.one("stores", $stateParams.id).get().then(function(store) {
    $scope.store = store;
  });
}]);
