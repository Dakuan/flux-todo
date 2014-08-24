# @cjsx React.DOM

_ = require('lodash')
React = require('react')

Header = require('./Header')
Footer = require('./Footer')
MainSection = require('./MainSection')

TodoStore = require('../stores/todo-store')

module.exports = React.createClass
  getInitialState: -> @getTodoState()
  componentDidMount: -> TodoStore.addChangeListener(@onChange)
  componentWillUnmount: -> TodoStore.removeChangeListener(@onChange)

  render: ->
    <div>
      <Header />
      <MainSection
        todos={@state.todos}
        areAllComplete={@state.areAllComplete}
      />
      <Footer todos={@state.todos} />
    </div>

  onChange: -> @setState(@getTodoState())
  getTodoState: ->
    {
      todos: TodoStore.getAll(),
      areAllComplete: TodoStore.areAllComplete()
    }
