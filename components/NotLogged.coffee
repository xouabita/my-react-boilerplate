React           = require 'react'
Router          = require 'react-router'
RouterBootstrap = require 'react-router-bootstrap'

{ ButtonLink } = RouterBootstrap

module.exports = React.createClass
  render: ->
    <div className="not-logged">
      <p>Seems like you are not login yet...</p>
      <ButtonLink to="/login" bsStyle="success">Login</ButtonLink>
      <ButtonLink to="/register" bsStyle="primary">Register</ButtonLink>
    </div>
