/*** @jsx React.DOM */

var _ = require('lodash');
var React = require('react');

var Header = require('./Header.react');
var Footer = require('./Footer.react');
var MainSection = require('./MainSection.react');

var TodoStore = require('../stores/todo-store');

var _getTodoState = function() {
  return {
    todos: TodoStore.getAll(),
    areAllComplete: TodoStore.areAllComplete()
  };
};

var TodoApp = React.createClass({
  getInitialState: function() {
    return _getTodoState();
  },

  componentDidMount: function() {
    TodoStore.addChangeListener(this._onChange);
  },

  componentWillUnmount: function() {
    TodoStore.removeChangeListener(this._onChange);
  },

  render: function() {
    return (
      <div>
        <Header />
        <MainSection
          todos={this.state.todos}
          areAllComplete={this.state.areAllComplete}
        />
        <Footer todos={this.state.todos} />
      </div>
    );
  },

  _onChange: function() {
    this.setState(_getTodoState());
  }

});

module.exports = TodoApp;
