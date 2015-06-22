React  = require 'react'
Page   = require '../components/Page.coffee'
Router = require 'react-router'

{ Link } = Router

module.exports = React.createClass
  render: ->
    <Page>
      <h4>We are on live !</h4>
      <p>
        <i>My React Boilerplate</i> is the perfect starter kit for react.
      </p>
    </Page>
