APP.controller('StoresListController', ['$scope', 'Restangular', function($scope, Restangular) {
  Restangular.one("stores", $stateParams.id).get().then(function(store) {
    $scope.store = store;
  });

  $scope.create = function(store) {
    Restangular.one("store").post(store).then(function(store) {
      $scope.stores.push(store);
    });
  };

  $scope.destroy = function(store) {
    store.remove().then(function() {
      _.remove($scope.store, function(w) {
        return w.id === store.id;
      });
    });
  };
}]);
