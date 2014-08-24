jest.autoMockOff()

_ = require('lodash')
TodoService = require('../todo-service')

describe 'TodoService', ->
  afterEach(-> TodoService.destroyAll())

  it 'is defined', ->
    functions = [
      'getAll', 'create', 'update', 'updateAll',
      'complete', 'completeAll', 'uncompleteAll',
      'areAllComplete', 'destroy', 'destroyCompleted'
    ]
    expect(TodoService).toBeDefined()
    _.each functions, (f) -> expect(TodoService[f]).toBeDefined()
  });

  describe 'getAll', ->
    it 'return hash that is empty by default', ->
      todos = TodoService.getAll()
      expect(todos).toEqual([])

  describe 'create and destroy', ->
    describe 'when 2 todos was created', ->
      beforeEach(-> TodoService.create('do that shit'))

      it 'contains 1 todo', ->
        todos = TodoService.getAll()
        expect(_.size(todos)).toEqual(1)

  describe 'complete', ->
    beforeEach(-> @todo = TodoService.create('todo'))

    it 'marks todo as complete', ->
      TodoService.complete(@todo.id)

      todo = TodoService.get(@todo.id)
      expect(todo.complete).toEqual(true)

  describe 'updateAll', ->
    beforeEach(->
      _.each ['one', 'two', 'three'], (text) ->
        TodoService.create(text)

    it 'updates all toods', ->
      TodoService.updateAll({ complete: true })
      _.each TodoService.getAll(), (todo) ->
        expect(todo.complete).toEqual(true)

  describe 'update', ->
    beforeEach(->
      @created_todo = TodoService.create('todo')
      @updated_todo = TodoService.update(
        @created_todo.id, { text: 'updated' }
      )
    )

    it 'updates todo attributes', ->
      expect(@updated_todo.text).toEqual('updated')
