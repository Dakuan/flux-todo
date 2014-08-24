merge = require('react/lib/merge')
copyProperties = require('react/lib/copyProperties')

class TodoService
  constructor: ->
    @storage = {}

  getAll: -> @storage

  get: (id) -> @storage[id]

  create: (text) ->
    id = Date.now()
    @storage[id] = {
      id: id,
      text: text,
      complete: false
    }

  update: (id, attrs) ->
    @storage[id] = copyProperties(@get(id), attrs)

  updateAll: (attrs) -> @update(id, attrs) for id in @storage

  complete: (id) -> @update(id, { complete: true })
  uncomplete: (id) -> @update(id, { complete: false })

  completeAll: -> @updateAll({ complete: true })
  uncompleteAll: -> @updateAll({ complete: false })

  areAllComplete: ->
    for id in @storage
      false if !@get(id).complete
    return true;
  },

  destroy: (id) -> delete @storage[id];

  destroyAll: -> @storage = {}

  destroyCompleted: ->
    for id in storage
      if @storage[id].complete
        @destroy(id)

module.exports = TodoService
