jest.autoMockOff();

var _ = require('lodash');
var TodoService = require('../todo-service.js');

describe('TodoService', function() {
  afterEach(function() {
    TodoService.destroyAll();
  });

  it('is defined', function() {
    var functions = [
      'getAll', 'create', 'update', 'updateAll',
      'complete', 'completeAll', 'uncompleteAll',
      'areAllComplete', 'destroy', 'destroyCompleted'
    ];
    expect(TodoService).toBeDefined();
    _.each(functions, function(f) {
      expect(TodoService[f]).toBeDefined();
    });
  });

  describe('getAll', function() {
    it('return hash that is empty by default', function() {
      var todos = TodoService.getAll();
      expect(todos).toEqual([]);
    });
  });

  describe('create and destroy', function() {
    describe('when 2 todos was created', function() {
      beforeEach(function() {
        TodoService.create('do that shit');
      });

      it('contains 1 todo', function() {
        var todos = TodoService.getAll();
        expect(_.size(todos)).toEqual(1);
      });
    });
  });

  describe('complete', function() {
    beforeEach(function() {
      this.todo = TodoService.create('todo');
    });

    it('marks todo as complete', function() {
      TodoService.complete(this.todo.id);

      todo = TodoService.get(this.todo.id);
      expect(todo.complete).toEqual(true);
    });
  });

  describe('updateAll', function() {
    beforeEach(function() {
      _.each(['one', 'two', 'three'], function(text) {
        TodoService.create(text);
      });
    });

    it('updates all toods', function() {
      TodoService.updateAll({ complete: true });
      _.each(TodoService.getAll(), function(todo) {
        expect(todo.complete).toEqual(true);
      });
    });
  });

  describe('update', function() {
    beforeEach(function() {
      this.created_todo = TodoService.create('todo');
      this.updated_todo = TodoService.update(
        this.created_todo.id,
        { text: 'updated' }
      );
    });

    it('updates todo attributes', function() {
      expect(this.updated_todo.text).toEqual('updated');
    });
  });
});

