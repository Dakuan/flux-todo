// var EventEmitter = require('event').EventEmitter;
var merge = require('react/lib/merge');

var AppDispatcher = require('../dispatchers/app-dispatcher.js');
var AppConstants = require('../constants/todo-constants.js');

var TodoService = require('../services/todo-service.js');

var CHANGE_EVENT = 'change';

var TodoStore = merge({}, {
  areAllComplete: TodoService.areAllComplete,
  getAll: TodoService.getAll,

  // _emitChange: function() {
  //   this.emit(CHANGE_EVENT);
  // },
  addChangeListener: function(callback) {
    this.on(CHANGE_EVENT, callback);
  },
  removeChangeListener: function(callback) {
    this.removeListener(CHANGE_EVENT, callback);
  },
  dispatcherIndex: AppDispatcher.register(function(payload) {
    var action = payload.action;

    switch (action.actionType) {
      case TodoConstants.TODO_CREATE:
        var text = action.text.trim();
        if (text !== '') {
          TodoService.create(text);
        }
        break;
      case TodoConstants.TODO_DESTROY:
        TodoService.destroy(action.id);
        break;
      case TodoConstants.TODO_COMPLETE:
        TodoService.complete(action.id);
        break;
        case TodoService.TODO_UNCOMPLETE:
        TodoService.update(action.id, { complete: false });
        break;
      case TodoConstants.TODO_TOGGLE_COMPLETE_ALL:
        if (TodoService.areAllComplete()) {
          TodoService.uncompleteAll();
        } else {
          TodoService.completeAll();
        }
        break;
      case TodoConstants.TODO_UPDATE_TEXT:
        TodoService.update(action.id, { text: action.text });
        break;
      case TodoConstants.TODO_DESTROY_COMPLETED:
        TodoService.destroyCompleted();
        break;
      default:
        return true;
    }

    _emitChange();
    return true;
  })
});

module.exports = TodoStore;
