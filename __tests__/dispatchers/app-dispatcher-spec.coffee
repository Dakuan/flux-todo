jest.autoMockOff()

AppDispatcher = require '../../src/coffee/dispatchers/app-dispatcher'

describe 'AppDispatcher', ->
  it 'sends actions to subscribers', ->
    listener = jest.genMockFunction()
    AppDispatcher.register(listener)
    payload = {}
    AppDispatcher.dispatch(payload)

    expect(listener.mock.calls.length).toBe(1)
    expect(listener.mock.calls[0][0]).toBe(payload)
