React  = require 'react'
Page   = require '../components/Page.coffee'

TodoList = require '../components/Todo/List.coffee'


module.exports = React.createClass

  render: ->
    if @props.initialState.user
      <Page>
        <TodoList />
      </Page>
    else
      <Page>
        <NotLogged />
      </Page>
