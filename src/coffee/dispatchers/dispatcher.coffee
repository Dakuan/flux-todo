Promise = require('es6-promise').Promise
merge   = require 'react/lib/merge'

class Dispatcher
  @_callbacks: []
  @_promises: []

  @register: (callback) ->
    @_callbacks.push(callback)
    @_callbacks.length - 1

  @dispatch: (payload) =>
    @_callbacks.forEach((callback) => @addPromise(callback, payload))
    Promise.all(@_promises).then(@clearPromises)

  @addPromise: (callback, payload) =>
    cb = (resolve, reject) ->
      if callback(payload)
        resolve(payload)
      else
        reject(new Error('Dispatcher callback unsuccessful'))

    promise = new Promise(cb)
    @_promises.push promise

  @clearPromises: => @_promises = []

module.exports = Dispatcher
