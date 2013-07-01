# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

app = angular.module 'posts', []

app.controller "PostsCntl", @PostsCntl = ($scope, $http) =>
  $http.get('/posts.json').success (data) ->
    $scope.posts = data

  # $scope.posts = [
  #   { id: 1, title: "Title 1", intro: "This is posting 1", body: "Body of posting 1" },
  #   { id: 2, title: "Title 2", intro: "This is posting 2", body: "Body of posting 2" },
  #   { id: 3, title: "Title 3", intro: "This is posting 3", body: "Body of posting 3" },
  # ]

