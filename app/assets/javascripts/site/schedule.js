
/* global app */
app.controller('ScheduleController', function($scope, $http) {
  $scope.orderByField = 'date';
  $scope.descend = true;
  $scope.date = new Date();

  $scope.changeDay = function(num) {
    $scope.date = new Date($scope.date.setDate($scope.date.getDate() + num));
    $scope.fillTable();
  };

  $scope.getDate = function() {
    var yyyy = $scope.date.getFullYear().toString();
    var mm = ($scope.date.getMonth()+1).toString(); // getMonth() is zero-based
    var dd  = $scope.date.getDate().toString();
    return yyyy+"-"+mm+"-"+dd;
  };

  $scope.toggleSort = function(orderByField) {

    // By De Morgan's Law
    // $scope.descend = !(($scope.orderByField == orderByField) && $scope.descend);
    $scope.descend = !($scope.orderByField == orderByField) || !$scope.descend;
    $scope.orderByField = orderByField;
  };

  $scope.data = {};
  $scope.fillTable = function() {
    $http.get('/appointment', {params: {date: $scope.date}}).success(function(data){
      $scope.data = data.appointments;
    }).error(function(data){
      console.log(data);
    });
  };
});
