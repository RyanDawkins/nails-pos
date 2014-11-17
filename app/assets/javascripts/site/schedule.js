Date.prototype.yyyymmdd = function() {
  var yyyy = this.getFullYear().toString();
  var mm = (this.getMonth()+1).toString(); // getMonth() is zero-based
  var dd  = this.getDate().toString();
  return yyyy+"-"+mm+"-"+dd;
};

function getTomorrow(d,offset){
  if (!offset){
    offset = 1;
  }
  if(typeof(d) === "string"){
    var t = d.split("-"); /* splits dd-mm-year */
    d = new Date(t[0], t[1] - 1, t[2]);
  }
  return new Date(d.setDate(d.getDate() + offset));
}

/* global app */
app.controller('ScheduleController', function($scope, $http) {
  $scope.orderByField = 'date';
  $scope.descend = true;
  $scope.date = new Date().yyyymmdd();

  $scope.changeDay = function(num) {
    $scope.date = getTomorrow($scope.date, num).yyyymmdd();
    $scope.fillTable();
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
