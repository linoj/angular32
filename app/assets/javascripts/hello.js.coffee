app = angular.module 'hello', []

app.controller "HelloCntl", @HelloCntl = ($scope) ->
  $scope.name = 'World'
