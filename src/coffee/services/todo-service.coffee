_              = require 'lodash'
merge          = require 'react/lib/merge'
copyProperties = require 'react/lib/copyProperties'

class TodoService
  @_storage: {}

  @getAll: => @_storage
  @get: (id) => @_storage[id]

  @create: (text) =>
    id = Date.now()
    @_storage[id] =
      id: id
      text: text
      complete: false

  @update: (id, attrs) =>
    @_storage[id] = copyProperties(@get(id), attrs)

  @updateAll: (attrs) => @update(id, attrs) for id of @_storage

  @complete: (id) => @update(id, { complete: true })
  @uncomplete: (id) => @update(id, { complete: false })

  @completeAll: => @updateAll { complete: true }
  @uncompleteAll: => @updateAll { complete: false }

  @areAllComplete: => _.any @_storage, (id) => not @get(id).complete

  @destroy: (id) => delete @_storage[id]
  @destroyAll: => @_storage = {}

  @destroyCompleted: =>
    _.chain @_storage
      .filter (id) => @_storage[id].complete
      .each (id) => @destroy(id)

module.exports = TodoService
