/*** @jsx React.DOM */

var _ = require('lodash');
var React = require('react');
var PropTypes = React.PropTypes;

var TodoActions = require('../actions/todo-actions');

var Footer = React.createClass({
  propTypes: {
    todos: PropTypes.object.isRequired
  },

  render: function() {
    var todos = this.props.todos;
    var total = _.size(todos);

    if (total === 0) {
      return null;
    }

    var completed = _.size(
      _.filter(todos, function(todo) {
        return todo.complete;
      })
    );

    var left = total - completed;

    var leftPhrase = left === 1 ? ' item ' : ' items ';
    leftPhrase += 'left';

    var clearCompletedButton;
    if (completed) {
      clearCompletedButton =
        <button
          id="clear-completed"
          onClick={this._onClearCompletedClick} >
          Clear completed ({completed})
        </button>;
    }

    return (
      <footer id="footer">
        <span id="todo-count">
          <strong>{left}</strong>
          {leftPhrase}
        </span>
        {clearCompletedButton}
      </footer>
    );
  },

  _onClearCompletedClick: function() {
    TodoActions.destroyCompleted();
  }
});

module.exports = Footer;
