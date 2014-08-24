merge = require('react/lib/merge')
copyProperties = require('react/lib/copyProperties')

class TodoService
  constructor: -> @storage = {}

  getAll: -> @storage
  get: (id) -> @storage[id]

  create: (text) ->
    id = Date.now()
    @storage[id] =
      id: id
      text: text
      complete: false

  update: (id, attrs) -> @storage[id] = copyProperties(@get(id), attrs)
  updateAll: (attrs) -> @update(id, attrs) for id in @storage

  complete: (id) -> @update(id, { complete: true })
  uncomplete: (id) -> @update(id, { complete: false })

  completeAll: -> @updateAll { complete: true }
  uncompleteAll: -> @updateAll { complete: false }

  areAllComplete: -> _.any @storage, (id) -> !@get(id).complete

  destroy: (id) -> delete @storage[id]
  destroyAll: -> @storage = {}

  destroyCompleted: ->
    _.chain @storage
      .filter (id) -> @storage[id].complete
      .each (id) -> @destroy(id)

module.exports = TodoService
