var merge = require('react/lib/merge');
var copyProperties = require('react/lib/copyProperties');

var TodoService = {
  _storage: {},

  getAll: function() {
     return this._storage;
  },

  get: function(id) {
    return this._storage[id];
  },

  create: function(text) {
    var id = Date.now();
    return (this._storage[id] = {
      id: id,
      text: text,
      complete: false
    });
  },

  update: function(id, attrs) {
    return (this._storage[id] = copyProperties(this.get(id), attrs));
  },

  updateAll: function(attrs) {
    for (var id in this._storage) {
      this.update(id, attrs);
    }
  },

  complete: function(id) {
    this.update(id, { complete: true });
  },

  completeAll: function() {
    this.updateAll({ complete: true });
  },

  uncompleteAll: function() {
    this.updateAll({ complete: false });
  },

  areAllComplete: function() {
    for (var id in this._storage) {
      if (!this.get(id).complete) {
        return false;
      }
    }
    return true;
  },

  destroy: function(id) {
    delete this._storage[id];
  },

  destroyAll: function() {
    this._storage = {};
  },

  destroyCompleted: function() {
    for (var id in this._storage) {
      if (this._storage[id].complete) {
        this.destroy(id);
      }
    }
  }
};

module.exports = TodoService;
