React           = require 'react'
Page            = require '../components/Page.coffee'
Router          = require 'react-router'
Bootstrap       = require 'react-bootstrap'
NotLogged       = require "../components/NotLogged.coffee"

{ Button } = Bootstrap

module.exports = React.createClass
  render: ->
    if this.props.initialState.user
      <Page>
        <p>You are logged as <i>{this.props.initialState.user.username}</i>. Congratulation !</p>
        <Button href="/logout" bsStyle="danger">Logout</Button>
      </Page>
    else
      <Page>
        <NotLogged />
      </Page>
