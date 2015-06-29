AppDispatcher    = require '../AppDispatcher.coffee'
{ EventEmitter } = require 'events'
assign           = require 'object-assign'

CHANGE_EVENT  = 'change'
TodoConstants = require '../constants/TodoConstants.coffee'

_todos = {}

create = (text) ->
  id = (+ new Date() + Math.floor Math.random() * 999999).toString(36)
  _todos[id] =
    id: id
    text: text
    complete: no

destroy = (id) ->
  delete _todos[id]

TodoStore = assign {}, EventEmitter.prototype,

  getAll: -> _todos

  emitChange: -> @emit CHANGE_EVENT

  addChangeListener: (callback) -> @on CHANGE_EVENT, callback

  removeChangeListener: (callback) -> @removeListener CHANGE_EVENT, callback

AppDispatcher.register (action) ->

  text = undefined

  switch action.actionType

    when TodoConstants.TODO_CREATE
      text = action.text.trim()
      if text isnt ''
        create text
        TodoStore.emitChange()

    when TodoConstants.TODO_DESTROY
      destroy action.id
      TodoStore.emitChange()

module.exports = TodoStore
