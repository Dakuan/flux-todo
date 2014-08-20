/*** @jsx React.DOM */

var _ = require('lodash');
var React = require('react');

var Header = require('./Header.react');
var Footer = require('./Footer.react');
var MainSection = require('./MainSection.react');
var TodoStore = require('../stores/todo-store');

var TodoApp = React.createClass({
  getInitialState: function() {
    return _getTodoState();
  },

  componentDidMount: function() {
    TodoStore.addChangeListener(this._onChange);
  },

  componentWillMount: function() {
    TodoStore.removeChangeListener(this._onChange);
  },

  render: function() {
    return (
      <div>
        <Header />
        <MainSection
          source={this.state.source}
          areAllComplete={this.state.areAllComplete}
        />
        <Footer source={this.state.source} />
      </div>
    );
  },

  _onChange: function() {
    this.setState(this._getTodoState());
  },

  _getTodoState: function() {
    return {
      source: TodoStore.getAll(),
      areAllComplete: TodoStore.areAllComplete()
    };
  }
});

module.exports = TodoApp;
