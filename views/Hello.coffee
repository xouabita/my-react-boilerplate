React     = require 'react'
BackAlpha = require '../components/BackAlpha.coffee'
Page = require '../components/Page.coffee'

module.exports = React.createClass
  render: ->
    <Page>
      <p>Hello, {this.props.params.name}</p>
    </Page>
