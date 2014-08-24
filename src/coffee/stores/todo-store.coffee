EventEmitter = require('events').EventEmitter
merge = require('react/lib/merge')

AppDispatcher = require('../dispatchers/app-dispatcher')
TodoConstants = require('../constants/todo-constants')

TodoService = require('../services/todo-service.js')

CHANGE_EVENT = 'change'

class TodoStore extends EventEmitter

  areAllComplete: -> TodoService.areAllComplete()
  getAll: -> TodoService.getAll()

  emitChange: -> @emit(CHANGE_EVENT)

  addChangeListener: (callback) ->
    @on(CHANGE_EVENT, callback)

  removeChangeListener: (callback) ->
    @removeListener(CHANGE_EVENT, callback)

  dispatcherIndex: AppDispatcher.register((payload) ->
    action = payload.action

    switch action.actionType
      when TodoConstants.CREATE
        text = action.text.trim()
        TodoService.create(text) if text !== ''

      when TodoConstants.DESTROY  then TodoService.destroy(action.id)
      when TodoConstants.COMPLETE then TodoService.complete(action.id)
      when TodoService.UNCOMPLETE then TodoService.uncomplete(action.id)

      when TodoConstants.TOGGLE_COMPLETE_ALL
        if TodoService.areAllComplete()
          TodoService.uncompleteAll()
        else
          TodoService.completeAll()
      when TodoConstants.UPDATE_TEXT
        TodoService.update(action.id, { text: action.text })

      when TodoConstants.DESTROY_COMPLETED then TodoService.destroyCompleted()

      else return true

    @emitChange()
    true
