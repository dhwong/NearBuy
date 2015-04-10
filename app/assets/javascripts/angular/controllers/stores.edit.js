APP.controller('StoresEditController', ['$scope', 'Restangular', function($scope, Restangular) {
  Restangular.one("stores", $stateParams.id).get().then(function(store) {
    $scope.store = store;
  });

  $scope.create = function(store) {
    Restangular.one("stores", $stateParams.id).post(store).then(function(store) {
      $scope.stores.push(store);
    });
  };

  function saveStore($scope, Restangular){
    $scope.store = {};
    $scope.saveStore=function(){
      $scope.stores = Restangular.all('data.json/:storeID').post($scope.store);
    }
  }
}]);
