app.controller('ScheduleController', function($scope) {
  $scope.orderByField = 'lastName';
  $scope.reverseSort = false;

  $scope.data = {
    schedules: [
      { firstName: 'Kyle', lastName: 'Riedemann', phone: '471-3895', date: '1:00', service: 'service' },
      { firstName: 'Ryan', lastName: 'Dawkins', phone: '111-1111', date: '2:00', service: 'service' },
      { firstName: 'Aaron', lastName: 'Weaver', phone: '222-2222', date: '3:00', service: 'service' },
      { firstName: 'Hali', lastName: 'Deubler', phone: '333-3333', date: '4:00', service: 'service' },
      { firstName: 'Marcus', lastName: 'Gabilheri', phone: '444-44444', date: '5:00', service: 'service' },
      { firstName: 'Carissa', lastName: 'Gabilheri', phone: '555-5555', date: '6:00', service: 'service' }
    ]
  };
});
