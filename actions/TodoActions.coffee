AppDispatcher = require '../AppDispatcher.coffee'
TodoConstants = require '../constants/TodoConstants.coffee'

TodoActions =

  create: (text) ->
    AppDispatcher.dispatch
      actionType: TodoConstants.TODO_CREATE
      text: text

  destroy: (id) ->
    AppDispatcher.dispatch
      actionType: TodoConstants.TODO_DESTROY
      id: id

module.exports = TodoActions
