React = require 'react'

{ PropTypes } = React

TodoItem  = require './Item.coffee'
TodoInput = require './Input.coffee'

module.exports = React.createClass

  propTypes:
    allTodos: PropTypes.array.isRequired

  render: ->

    allTodos = @props.allTodos
    todos    = []
    for todo, i in allTodos
      todos.push <TodoItem todo={todo} key={i}/>

    <section id="TodoList" className="col-xs-offset-2 col-xs-8">
      <h1>Todo List</h1>
      <TodoInput className="col-xs-12" placeholder="What need to be done ?" />
      <ul id="todo-list" className="col-xs-12">{todos}</ul>
    </section>
