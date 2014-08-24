# @cjsx React.DOM

_ = require('lodash')
React = require('react')
PropTypes = React.PropTypes

TodoActions = require('../actions/todo-actions')
TodoItem = require('./TodoItem')

module.exports = React.createClass
  propTypes:
    todos: PropTypes.object.isRequired
    areAllComplete: PropTypes.bool.isRequired

  render: ->
    todos = @props.todos

    return null if _.size(todos) < 1

    list = []
    _.forIn todos, (value, key) ->
      list.push <TodoItem key={key} todo={todos[key]} />

    checked = if @props.areAllComplete then 'checked' else ''

    <section id='main'>
      <input
        id='toggle-all'
        type='checkbox'
        onChange={@onToggleCompleteAll}
        checked={checked}
      />
      <label htmlFor='toggle-all'>Mark all as complete</label>
      <ul id='todo-list'>{list}</ul>
    </section>
