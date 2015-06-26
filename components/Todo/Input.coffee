React = require 'react'

{ PropTypes } = React

ENTER_KEY_CODE = 13

module.exports = React.createClass

  propTypes:
    className: PropTypes.string
    id: PropTypes.string
    placeholder: PropTypes.string
    value: PropTypes.string

  getInitialState: ->
    value: @props.value || ''

  render: ->
    <input
      className={@props.className}
      id={@props.id}
      placeholder={@props.placeholder}
    />

