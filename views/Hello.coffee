React = require 'react'

module.exports = React.createClass
  render: -> <p>Hello, {this.props.params.name}</p>
