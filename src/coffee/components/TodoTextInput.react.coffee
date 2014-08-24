/*** @jsx React.DOM */

React = require('react')
PropTypes = React.PropTypes

ENTER_KEY_CODE = 13

module.exports = React.createClass({
  propTypes:
    className: PropTypes.string
    id: PropTypes.string
    placeholder: PropTypes.string,
    onSave: PropTypes.func.isRequired
    value: PropTypes.string

  getInitialState: -> { value: @props.value || '' }

  render: ->
    (
      <input
        className={@props.className}
        id={@props.id}
        placeholder={@props.placeholder}
        onBlur={@save}
        onChange={@onChange}
        onKeyDown={@onKeyDown}
        value={@state.value}
        autoFocus={true}
      />
    )

  @save: ->
    @props.onSave(@state.value)
    @setState({ value: '' })

  @onChange: (event) ->
    @setState({ value: event.target.value })

  @onKeyDown: (event) ->
    if event.keyCode == ENTER_KEY_CODE
      @save()
