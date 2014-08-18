var _ = require('lodash');
var TodoService = require('../../js/services/todo-service.js');

describe('TodoService', function() {
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
      afterEach(function() {
        TodoService.destroyAll();
      });

      it('contains 1 todo', function() {
        var todos = TodoService.getAll();
        expect(_.size(todos)).toEqual(1);
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
