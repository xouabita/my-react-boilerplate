React           = require 'react'
Page            = require '../components/Page.coffee'
Router          = require 'react-router'
Bootstrap       = require 'react-bootstrap'
RouterBootstrap = require 'react-router-bootstrap'

{ Button     } = Bootstrap
{ ButtonLink } = RouterBootstrap

module.exports = React.createClass
  render: ->
    if this.props.initialState.user
      <Page>
        <p>You are logged as <i>{this.props.initialState.user.username}</i>. Congratulation !</p>
        <Button href="/logout" bsStyle="danger">Logout</Button>
      </Page>
    else
      <Page>
        <p>Seems like you are not login yet...</p>
        <ButtonLink to="/login" bsStyle="success">Login</ButtonLink>
        <ButtonLink to="/register" bsStyle="primary">Register</ButtonLink>
      </Page>
