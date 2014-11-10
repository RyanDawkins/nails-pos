app.controller("EmployeeTableController", function($scope, $http){

  $scope.employees = [];
  $scope.isCreating = false;
  $scope.newEmployee = {};
  $scope.editing = false;

  var loadTable = function() {
    $http.get('/employee').
      success(function(data, status, headers, config) {
        $scope.employees = data;
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

  $scope.showEmployeeForm = function(employee) {
    toggleCreating();
    if(employee) {
      $scope.editing = true;
      $scope.newEmployee = employee;
    } else {
      $scope.editing = false;
      $scope.newEmployee = {};
    }
  };

  $scope.createEmployee = function() {
    var employee = $scope.newEmployee;
    $scope.newEmployee = {};
    $http.post('/employee/create', employee).
      success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    error(function(data, status, headers, config) {});
  };

  $scope.editEmployee = function() {
    var employee = $scope.newEmployee;
    $scope.newEmployee = {};
    $http.post('/employee/'+employee.id+"/update", employee).
      success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    error(function(data, status, headers, config) {});
  };

  $scope.delete = function(employee) {
    $http.get('/employee/'+employee.id+'/delete').
      success(function(data, status, headers, config) {
        loadTable();
    }).
    error(function(data, status, headers, config) {});
  };

  $scope.loadTable = loadTable;
});
