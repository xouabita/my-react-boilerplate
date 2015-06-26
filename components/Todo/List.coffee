React = require 'react'

{ PropTypes } = React

TodoItem  = require './Item.coffee'
TodoInput = require './Input.coffee'

TodoStore   = require '../../stores/TodoStore.coffee'
TodoActions = require '../../actions/TodoActions.coffee'

getTodoState = ->
  allTodos: TodoStore.getAll()

module.exports = React.createClass

  getInitialState: -> getTodoState()

  componentDidMount: -> TodoStore.addChangeListener @_onChange

  componentWillUnmount: -> TodoStore.removeChangeListener @_onChange

  render: ->

    allTodos = @state.allTodos
    todos    = []
    for id of allTodos
      todos.push <TodoItem todo={allTodos[id]} key={id}/>

    <section id="TodoList" className="col-xs-offset-2 col-xs-8">
      <h1>Todo List</h1>
      <TodoInput
        className="col-xs-12"
        placeholder="What need to be done ?"
        id="new-todo"
        onSave={@_onSave}
      />
      <ul id="todo-list" className="col-xs-12">{todos}</ul>
    </section>

  _onChange: ->
    @setState getTodoState()

  _onSave: (text) ->
    TodoActions.create text if text.trim()
