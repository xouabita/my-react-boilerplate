React  = require 'react'
Page   = require '../components/Page.coffee'

TodoList = require '../components/Todo/List.coffee'


module.exports = React.createClass

  render: ->

    <Page>
      <TodoList />
    </Page>
