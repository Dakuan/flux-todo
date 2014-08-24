# @cjsx React.DOM

React = require('react')
PropTypes = React.PropTypes

TodoActions = require('../actions/todo-actions')
TodoTextInput = require('./TodoTextInput')

module.exports = React.createClass
  render: ->
    <header id='header'>
      <h1>todos</h1>
      <TodoTextInput
        id='new-todo'
        placeholder='What needs to be done?'
        onSave={@onSave}
      />
    </header>

  onSave: (text) ->
    TodoActions.create(text) if text.trim()
