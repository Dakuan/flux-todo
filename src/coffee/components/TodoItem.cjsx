# @cjsx React.DOM

React = require('react')
PropTypes = React.PropTypes

TodoActions = require('../actions/todo-actions')
TodoTextInput = require('./TodoTextInput')

cx = require('react/lib/cx')

module.exports = React.createClass
  propTypes: { todo: PropTypes.object.isRequired }

  getInitialState: -> { isEditing: false }

  render: ->
    todo = @props.todo

    input = null
    if @state.isEditing
      input =
        <TodoTextInput
          className="edit"
          onSave={@onSave}
          value={todo.text}
        />

    itemClass = cx
      'completed': todo.complete
      'editing': @state.isEditing

    <li className={itemClass} key={todo.id}>
      <div className='view'>
        <input
          className='toggle'
          type='checkbox'
          checked={todo.complete}
          onChange={@onToggleComplete}
        />

        <label onDoubleClick={@onDoubleClick}>
          {todo.text}
        </label>

        <button
          className='destroy'
          onClick={@onDestroyClick}
        />
      </div>
      {input}
    </li>

  onToggleComplete: -> TodoActions.toggleComplete(@props.todo)

  onDoubleClick: -> @setState({ isEditing: true })

  onSave: (text) ->
    TodoActions.updateText(@props.todo.id, text)
    @setState({ isEditing: false })

  onDestroyClick: -> TodoActions.destroy(@props.todo.id)
