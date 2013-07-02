
describe "PostsCntl", ->
  fixture      = [
    { id: 1, title: "Title 1", intro: "This is posting 1" },
    { id: 2, title: "Title 2", intro: "This is posting 2" }
  ]
  scope        = null
  cntl         = null
  $httpBackend = null

  beforeEach inject (_$httpBackend_, $rootScope, $controller) ->
    $httpBackend = _$httpBackend_
    $httpBackend.whenGET( /^\/posts.json.*$/ ).respond(fixture)
    scope = $rootScope.$new()
    cntl  = $controller(PostsCntl, {$scope: scope})

  it 'creates posts model with index request', ->
    expect(scope.posts).toBeUndefined()
    $httpBackend.flush()
    expect(scope.posts.length).toBe 2
    expect(scope.posts).toEqual fixture

  it "can run tests", ->
    expect(true).toBe(true)

  # it "creates posts model with 3 posts", ->
  #   scope = {}
  #   cntl = new PostsCntl(scope)
  #   expect( scope.posts.length ).toBe(3)


