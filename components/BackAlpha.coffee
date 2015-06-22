React = require 'react'

module.exports = React.createClass
  render: ->
    codeBlockStyle =
      width: "100%"
      height: "100%"
      position: "fixed"
      zIndex: -1
      left: 0
      top: 0
      opacity: this.props.opacity || 0.5
      backgroundColor: this.props.color || "#fff"

    <div style={codeBlockStyle} className="back-alpha"></div>
