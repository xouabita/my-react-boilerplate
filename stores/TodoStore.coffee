AppDispatcher    = require '../AppDispatcher.coffee'
{ EventEmitter } = require 'events'
assign           = require 'object-assign'

CHANGE_EVENT  = 'change'
TodoConstants = require '../constants/TodoConstants.coffee'

_todos = {}

setTodos = (todos) ->
  _todos = {}
  _todos[todo._id] = todo for todo in todos

create = (todo) ->
  _todos[todo._id] = todo

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

    when TodoConstants.TODO_RECEIVE
      setTodos action.todos
      TodoStore.emitChange()

    when TodoConstants.TODO_CREATE
      create action.todo
      TodoStore.emitChange()

    when TodoConstants.TODO_DESTROY
      destroy action.id
      TodoStore.emitChange()

module.exports = TodoStore
