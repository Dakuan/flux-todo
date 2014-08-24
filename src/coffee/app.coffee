/*** @jsx React.DOM */

window.React = require('react')
TodoApp = require('./components/TodoApp.react')

window.React.renderComponent(
  <TodoApp />,
  document.getElementById('app')
)
