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
    console.log('/'+config.url);
    $http.get('/'+config.url).
    /*jshint unused:false */
    success(function(data, status, headers, config) {
        $scope.persons = data;
    }).
    /*jshint unused:false */
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
    /*jshint unused:false */
    success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    /*jshint unused:false */
    error(function(data, status, headers, config) {});
  };

  $scope.editPerson = function() {
    var person = $scope.newPerson;
    $scope.newPerson = {};
    $http.post('/'+config.url+'/'+person.id+"/update", person).
    /*jshint unused:false */
    success(function(data, status, headers, config) {
        loadTable();
        toggleCreating();
    }).
    /*jshint unused:false */
    error(function(data, status, headers, config) {});
  };

  $scope.delete = function(person) {
    $http.get('/'+config.url+'/'+person.id+'/delete').
    /*jshint unused:false */
    success(function(data, status, headers, config) {
        loadTable();
    }).
    /*jshint unused:false */
    error(function(data, status, headers, config) {});
  };

  $scope.loadTable = loadTable;
});
