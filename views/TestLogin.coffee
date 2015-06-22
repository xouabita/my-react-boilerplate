React           = require 'react'
Page            = require '../components/Page.coffee'
Router          = require 'react-router'
RouterBootstrap = require 'react-router-bootstrap'

{ ButtonLink } = RouterBootstrap

module.exports = React.createClass
  render: ->
    if this.props.user
      <Page>
        <p>You are logged as <i>{this.props.user.username}</i>. Congratulation !</p>
        <ButtonLink to="/logout" bsStyle="danger">Logout</ButtonLink>
      </Page>
    else
      <Page>
        <p>Seems like you are not login yet...</p>
        <ButtonLink to="/login" bsStyle="success">Login</ButtonLink>
        <ButtonLink to="/register" bsStyle="primary">Register</ButtonLink>
      </Page>
