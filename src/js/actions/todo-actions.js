var AppDispatcher = require('../dispatchers/app-dispatcher.js');
var TodoConstants = require('../constants/todo-constants.js');

var TodoActions = {
  create: function(text) {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_CREATE,
      text: text
    });
  },

  updateText: function(id, text) {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_UPDATE_TEXT,
      id: id,
      text: text
    });
  },

  complete: function(todo) {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_COMPLETE,
      id: todo.id
    });
  },

  uncomplete: function(todo) {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_UNCOMPLETE,
      id: todo.id
    });
  },

  toggleComplete: function(todo) {
    if (todo.complete) {
      AppDispatcher.handleViewAction({
        actionType: TodoConstants.TODO_UNCOMPLETE,
        id: todo.id
      });
    } else {
      AppDispatcher.handleViewAction({
        actionType: TodoConstants.TODO_COMPLETE,
        id: todo.id
      });
    }
  },

  toggleCompleteAll: function() {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_TOGGLE_COMPLETE_ALL
    });
  },

  destroy: function(todo) {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_DESTROY,
      id: todo.id
    });
  },

  destroyCompleted: function() {
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TODO_DESTROY_COMPLETED
    });
  }
};

module.exports = TodoActions;
