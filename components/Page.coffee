# Requirements
React           = require 'react'
Router          = require 'react-router'
Bootstrap       = require 'react-bootstrap'
RouterBootstrap = require 'react-router-bootstrap'

# Components
BackAlpha = require './BackAlpha.coffee'

{
  Nav,
  ListGroup,
  PageHeader
} = Bootstrap

{ NavItemLink } = RouterBootstrap

module.exports = React.createClass
  render: ->
    <div className="page container">
        <div className="header clearfix">
          <Nav bsStyle="pills" pullRight>
            <NavItemLink to="/">Home</NavItemLink>
            <NavItemLink to="/hello/xou">Hello xou !</NavItemLink>
            <NavItemLink to="/test-login">Test Login</NavItemLink>
            <NavItemLink to="/todo">Todo</NavItemLink>
          </Nav>
          <h3>My React Boilerplate</h3>
        </div>
        {this.props.children}
        <footer>© xouabita | 2015 | <a href="http://graphr.co">graphr</a></footer>
      <BackAlpha />
    </div>
