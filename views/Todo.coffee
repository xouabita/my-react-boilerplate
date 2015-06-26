React  = require 'react'
Page   = require '../components/Page.coffee'

{ TodoInput, TodoList } = require '../components/Todo/index.coffee'


module.exports = React.createClass

  render: ->

    todos = [
      text: 'lol'
    ,
      text: 'mdr'
    ]

    <Page>
      <TodoList allTodos={todos} />
    </Page>
