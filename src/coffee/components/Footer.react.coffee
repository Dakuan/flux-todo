/*** @jsx React.DOM */

_ = require('lodash')
React = require('react')
PropTypes = React.PropTypes

TodoActions = require('../actions/todo-actions')

module.exports = React.createClass
  propTypes:
    todos: PropTypes.object.isRequired

  render: ->
    todos = this.props.todos
    total = _.size(todos)

    return null if total === 0

    completed = _.size(_.filter(todos, (todo) -> todo.complete))
    left = total - completed

    leftPhrase = if left === 1 then ' item ' else ' items '
    leftPhrase += 'left'

    clearCompletedButton = null
    if completed
      clearCompletedButton =
        <button
          id="clear-completed"
          onClick={@onClearCompletedClick} >
          Clear completed ({completed})
        </button>

    (
      <footer id="footer">
        <span id="todo-count">
          <strong>{left}</strong>
          {leftPhrase}
        </span>
        {clearCompletedButton}
      </footer>
    )

  @onClearCompletedClick: -> TodoActions.destroyCompleted()
