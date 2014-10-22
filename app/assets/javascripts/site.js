var app = angular.module("CustomerApp", []);
app.controller("CustomerTableController", function($scope, $http){

  $scope.customers = [];
  $scope.isCreating = false;
  $scope.newCustomer = {};

  var loadTable = function() {
    $http.get('/customer').
      success(function(data, status, headers, config) {
        $scope.customers = data;
    }).
    error(function(data, status, headers, config) {
      // called asynchronously if an error occurs
      // or server returns response with an error status.
      console.log(data);
    });
  };

  var toggleCreating = function() {
    $scope.isCreating = !$scope.isCreating;
  };

  $scope.toggleCreating = toggleCreating;

  $scope.createCustomer = function() {
    toggleCreating();
  };

  $scope.saveCustomer = function() {
    var customer = $scope.newCustomer;
    $scope.newCustomer = {};
    $http.post('/customer/create', customer).
      success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    error(function(data, status, headers, config) {
      // called asynchronously if an error occurs
      // or server returns response with an error status.
      console.log(data);
    });
  };

  $scope.loadTable = loadTable;
});
