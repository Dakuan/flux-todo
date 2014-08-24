/*** @jsx React.DOM */

_ = require('lodash')
React = require('react')

Header = require('./Header.react')
Footer = require('./Footer.react')
MainSection = require('./MainSection.react')

TodoStore = require('../stores/todo-store')

module.exports = React.createClass
  @getTodoState: ->
    {
      todos: TodoStore.getAll(),
      areAllComplete: TodoStore.areAllComplete()
    }

  getInitialState: -> @getTodoState()
  componentDidMount: -> TodoStore.addChangeListener(@onChange)
  componentWillUnmount: -> TodoStore.removeChangeListener(@onChange)

  render: ->
    (
      <div>
        <Header />
        <MainSection
          todos={this.state.todos}
          areAllComplete={this.state.areAllComplete}
        />
        <Footer todos={this.state.todos} />
      </div>
    )

  @onChange: -> @setState(_getTodoState())
