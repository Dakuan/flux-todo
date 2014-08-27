Dispatcher = require './dispatcher'
merge      = require 'react/lib/merge'

class AppDispatcher extends Dispatcher
  handleViewAction: (action) ->
    @dispatch({ source: 'VIEW_ACTION', action: action })

module.exports = AppDispatcher
