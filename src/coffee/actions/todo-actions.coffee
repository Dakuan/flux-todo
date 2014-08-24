AppDispatcher = require('../dispatchers/app-dispatcher')
TodoConstants = require('../constants/todo-constants')

module.exports =
  create: (text) ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.CREATE,
      text: text
    })

  updateText: (id, text) ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.UPDATE_TEXT,
      id: id,
      text: text
    })

  complete: (todo) ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.COMPLETE,
      id: todo.id
    })

  uncomplete: (todo) ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.UNCOMPLETE,
      id: todo.id
    })

  toggleComplete: (todo) ->
    if todo.complete)
      AppDispatcher.handleViewAction({
        actionType: TodoConstants.UNCOMPLETE,
        id: todo.id
      })
    else
      AppDispatcher.handleViewAction({
        actionType: TodoConstants.COMPLETE,
        id: todo.id
      })

  toggleCompleteAll: ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.TOGGLE_COMPLETE_ALL
    })

  destroy: (todo) ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.DESTROY,
      id: todo.id
    })

  destroyCompleted: ->
    AppDispatcher.handleViewAction({
      actionType: TodoConstants.DESTROY_COMPLETED
    })
