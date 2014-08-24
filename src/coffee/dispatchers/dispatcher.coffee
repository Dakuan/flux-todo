Promise = require('es6-promise').Promise
merge = require('react/lib/merge')

class Dispatcher
  constructor: ->
    @callbacks = []
    @promises  = []

  register: (callback) ->
    @callbacks.push(callback)
    @callbacks.length - 1

  dispatch: (payload) ->
    @callbacks.forEach((callback) -> addPromise(callback, payload))
    Promise.all(@promises).then(clearPromises)


  @addPromise = (callback, payload) ->
    @promises.push(new Promise((resolve, reject) ->
      if callback(payload)
        resolve(payload)
      else
        reject(new Error('Dispatcher callback unsuccessful'))
    ))

  @clearPromises = -> @promises = []

module.exports = Dispatcher
