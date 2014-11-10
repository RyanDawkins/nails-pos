app.controller("CustomerTableController", function($scope, $http){

  $scope.customers = [];
  $scope.isCreating = false;
  $scope.newCustomer = {};
  $scope.editing = false;

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

  $scope.showCustomerForm = function(customer) {
    toggleCreating();
    if(customer) {
      $scope.editing = true;
      $scope.newCustomer = customer;
    } else {
      $scope.editing = false;
      $scope.newCustomer = {};
    }
  };

  $scope.createCustomer = function() {
    var customer = $scope.newCustomer;
    $scope.newCustomer = {};
    $http.post('/customer/create', customer).
      success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    error(function(data, status, headers, config) {});
  };

  $scope.editCustomer = function() {
    var customer = $scope.newCustomer;
    $scope.newCustomer = {};
    $http.post('/customer/'+customer.id+"/update", customer).
      success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    error(function(data, status, headers, config) {});
  };

  $scope.delete = function(customer) {
    $http.get('/customer/'+customer.id+'/delete').
      success(function(data, status, headers, config) {
        loadTable();
    }).
    error(function(data, status, headers, config) {});
  };

  $scope.loadTable = loadTable;
});
