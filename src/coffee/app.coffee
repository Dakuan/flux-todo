# @cjsx React.DOM

window.React = require('react')
TodoApp = require('./components/TodoApp')

window.React.renderComponent <TodoApp />,
  document.getElementById('app')
