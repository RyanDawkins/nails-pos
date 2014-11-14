/* global app */
app.controller('ScheduleController', function($scope, $http) {
  $scope.orderByField = 'date';
  $scope.reverseSort = false;

  $scope.toggleSort = function(orderByField) {
    $scope.orderByField = orderByField;
    $scope.reverseSort = !$scope.reverseSort;
  };

  $scope.data = {};
  $scope.fillTable = function() {
    $http.get('/appointment').success(function(data){
      $scope.data = data;
      console.log(data[0]);
    }).error(function(data){
      console.log(data);
    });
  };
});
