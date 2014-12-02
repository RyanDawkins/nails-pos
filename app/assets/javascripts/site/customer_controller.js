app.controller('CustomerController', function($scope, $http) {

  $scope.isScheduling = false;

  $scope.schedule = function(person) {
    $scope.isScheduling = true;
    $scope.schedulee = person;
  };

  $scope.stopScheduling = function() {
    $scope.isScheduling = false;
  };

});
