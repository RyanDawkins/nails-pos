app.controller('ScheduleController', ['$scope', '$filter', function($scope, $filter) {
  var orderBy = $filter('orderBy');
  $scope.friends = [
    { name: 'Kyle', phone: '471-3895', date: '1:00', service: 'service' },
    { name: 'Ryan', phone: '111-1111', date: '2:00', service: 'service' },
    { name: 'Aaron', phone: '222-2222', date: '3:00', service: 'service' },
    { name: 'Hali', phone: '333-3333', date: '4:00', service: 'service' },
    { name: 'Marcus', phone: '444-44444', date: '5:00', service: 'service' },
    { name: 'Carissa', phone: '555-5555', date: '6:00', service: 'service' },
  ];
  $scope.order = function(predicate, reverse) {
    $scope.friends = orderBy($scope.friends, predicate, reverse);
  };
}]);
