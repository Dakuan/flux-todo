/*** @jsx React.DOM */

_ = require('lodash');
var React = require('react');
var PropTypes = React.PropTypes;

var TodoActions = require('../actions/todo-actions');
var TodoItem = require('./TodoItem.react');

var MainSection = React.createClass({
  propTypes: {
    source: PropTypes.object.isRequired,
    areAllComplete: PropTypes.bool.isRequired
  },

  render: function() {
    var source = this.props.source;

    if (_.size(source) < 1) {
      return null;
    }

    var todos = [];
    _.forIn(source, function(value, key) {
      todos.push(<TodoItem key={key} todo={source[key]} />);
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
        <ul id='todo-list'>{todos}</ul>
      </section>
    );
  }
});

module.exports = MainSection;
