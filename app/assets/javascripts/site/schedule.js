app.controller('ScheduleController', ['$scope', '$filter', function($scope, $filter) {
  var orderBy = $filter('orderBy');
  $scope.friends = [
    { name: 'Kyle', phone: '471-3895' },
    { name: 'Ryan', phone: '555-5555' },
    { name: 'Aaron', phone: '555-5555' },
    { name: 'Hali', phone: '555-5555' },
    { name: 'Marcus', phone: '555-5555' },
    { name: 'Carissa', phone: '555-5555' },
  ];
  $scope.order = function(predicate, reverse) {
    $scope.friends = orderBy($scope.friends, predicate, reverse);
  };
}]);
