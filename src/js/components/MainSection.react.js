/*** @jsx React.DOM */

_ = require('lodash');
var React = require('react');
var PropTypes = React.PropTypes;

var TodoActions = require('../actions/todo-actions');
var TodoItem = require('./TodoItem.react');

var MainSection = React.createClass({
  propTypes: {
    todos: PropTypes.object.isRequired,
    areAllComplete: PropTypes.bool.isRequired
  },

  render: function() {
    var todos = this.props.todos;

    if (_.size(todos) < 1) {
      return null;
    }

    var list = [];
    _.forIn(todos, function(value, key) {
      list.push(<TodoItem key={key} todo={todos[key]} />);
    });

    return (
      <section id='main'>
        <input
          id='toggle-all'
          type='checkbox'
          onChange={this._onToggleCompleteAll}
          checked={this.props.areAllComplete ? 'checked' : '' }
        />
        <label htmlFor='toggle-all'>Mark all as complete</label>
        <ul id='todo-list'>{list}</ul>
      </section>
    );
  }
});

module.exports = MainSection;
