
describe "PostsCtrl", ->
  $fixture     = [
    { id: 1, title: "Title 1", intro: "This is posting 1" },
    { id: 2, title: "Title 2", intro: "This is posting 2" }
  ]
  $scope       = null
  $controller  = null
  $httpBackend = null

  beforeEach module('Posts')

  beforeEach inject ($injector) ->
    $scope       = $injector.get('$rootScope').$new()
    $controller  = $injector.get('$controller')
    $httpBackend = $injector.get('$httpBackend')
    $httpBackend.when('GET','/posts.json').respond($fixture)

  beforeEach ->
    this.addMatchers({
      # we need to use toEqualData because the Resource hase extra properties which make simple .toEqual not work.
      toEqualData: (expect) ->
        angular.equals(expect, this.actual)
    })
    
  it 'creates posts model with index request', ->
    $httpBackend.expect('GET', '/posts').respond($fixture)
    $controller(PostsCtrl, {$scope: $scope })
    expect($scope.posts).toEqualData []
    $httpBackend.flush()
    expect($scope.posts.length).toBe 2
    expect($scope.posts).toEqualData $fixture

  it "can run tests", ->
    expect(true).toBe(true)

  # it "creates posts model with 3 posts", ->
  #   scope = {}
  #   controller = new PostsCtrl(scope)
  #   expect( scope.posts.length ).toBe(3)


