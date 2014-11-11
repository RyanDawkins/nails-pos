var config = {
  url: $("#controller-div").attr("config-url")
};
/* global app */
app.controller("PersonTableController", function($scope, $http){

  $scope.persons = [];
  $scope.isCreating = false;
  $scope.newPerson = {};
  $scope.editing = false;

  var loadTable = function() {
    $http.get('/'+config.url).
    success(function(data) {
        $scope.persons = data;
    }).
    error(function(data) {
      // called asynchronously if an error occurs
      // or server returns response with an error status.
      console.log(data);
    });
  };

  var toggleCreating = function() {
    $scope.isCreating = !$scope.isCreating;
  };

  $scope.toggleCreating = toggleCreating;

  $scope.showPersonForm = function(person) {
    toggleCreating();
    if(person) {
      $scope.editing = true;
      $scope.newPerson = person;
    } else {
      $scope.editing = false;
      $scope.newPerson = {};
    }
  };

  $scope.createPerson = function() {
    var person = $scope.newPerson;
    $scope.newPerson = {};
    $http.post('/'+config.url+'/create', person).
    success(function() {
      loadTable();
      toggleCreating();
    }).
    error(function(data) {
      console.log(data);
    });
  };

  $scope.editPerson = function() {
    var person = $scope.newPerson;
    $scope.newPerson = {};
    $http.post('/'+config.url+'/'+person.id+"/update", person).
    success(function() {
      loadTable();
      toggleCreating();
    }).
    error(function(data) {
      console.log(data);
    });
  };

  $scope.delete = function(person) {
    $http.get('/'+config.url+'/'+person.id+'/delete').
    success(function() {
        loadTable();
    }).
    error(function(data) {
      console.log(data);
    });
  };

  $scope.loadTable = loadTable;
});
