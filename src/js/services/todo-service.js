var merge = require('react/lib/merge');

var TodoService = {
  _storage: [],

  create: function(text) {
    id = Date.now();
    _storage[id] = {
      id: id,
      text: text,
      complete: false
    };
  },

  update: function(id, attrs) {
    var todo = todos[id];
    todo = merge(todo, attrs);
  },

  updateAll: function(attrs) {
    for (var id in todos) {
      _update(id, attrs);
    }
  },

  complete: function(id) {
    _update(id, { complete: true });
  },

  completeAll: function() {
    _updateAll({ complete: true });
  },

  uncompleteAll: function() {
    _updateAll({ complete: false });
  },

  areAllComplete: function() {
    for (var id in _storage) {
      if (!_storage[id].complete) {
        return false;
      }
    }
    return true;
  },

  destroy: function(id) {
    delete _storage[id];
  },

  destroyCompleted: function() {
    for (var id in _storage) {
      if (_storage[id].complete) {
        _destroy(id);
      }
    }
  }
};

module.exports = TodoService;
