AppDispatcher    = require './AppDispatcher.coffee'
{ EventEmitter } = require 'events'
assign           = require 'object-assign'

CHANGE_EVENT = 'change'
TodoConstants = '../constants/TodoConstants.coffee'

_todos = {}

create = (text) ->
  id = (+ new Date() + Math.floor Math.random() * 999999).toString(36)
  _todos[id] =
    id: id
    text: text
    complete: no

update = (id, updates) ->
  _todos[id] = assign({}, _todos[id], updates)

updateAll = (updates) ->
  for id of _todos
    update id, updates

destroy = (id) ->
  delete _todos[id]

destroyCompleted = () ->
  destroy(id) for id of _todos when _todos[id].complete

TodoStore = assign {}, EventEmitter.prototype,

  areAllComplete: ->
    return no for id of _todos when _todos[id].complete isnt yes
    return yes

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
