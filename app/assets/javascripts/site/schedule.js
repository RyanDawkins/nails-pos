/* global app */
app.controller('ScheduleController', function($scope, $http) {
  $scope.orderByField = 'date';
  $scope.descend = true;

  $scope.toggleSort = function(orderByField) {

    // By De Morgan's Law
    // $scope.descend = !(($scope.orderByField == orderByField) && $scope.descend);
    $scope.descend = !($scope.orderByField == orderByField) || !$scope.descend;
    $scope.orderByField = orderByField;
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
