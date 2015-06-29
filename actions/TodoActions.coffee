AppDispatcher = require '../AppDispatcher.coffee'
TodoConstants = require '../constants/TodoConstants.coffee'
Api           = require '../services/Api.coffee'
{ Promise }   = require 'es6-promise'

TodoActions =

  getTodos: ->
    Api.get '/api/todo'
    .then (todos) ->
      AppDispatcher.dispatch
        actionType: TodoConstants.TODO_RECEIVE
        todos: todos

  create: (text) ->
    Api.post '/api/todo', text: text
    .then (todo) ->
      AppDispatcher.dispatch
        actionType: TodoConstants.TODO_CREATE
        todo: todo

  destroy: (id) ->
    Api.delete "/api/todo/#{id}"
    .then ->
      console.log "coucou"
      AppDispatcher.dispatch
        actionType: TodoConstants.TODO_DESTROY
        id: id

module.exports = TodoActions
