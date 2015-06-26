React = require 'react'

{ PropTypes } = React
{ Button }    = require "react-bootstrap"

module.exports = React.createClass

  PropTypes:
    todo: PropTypes.object.isRequired
    key: PropTypes.string.isRequired

  render: ->
    <li key={@props.key} className='todo-item col-xs-12'>
      <label className="col-xs-10">{@props.todo.text}</label>
      <Button className="destroy col-xs-2" bsStyle="danger">Delete</Button>
    </li>
