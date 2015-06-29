React = require 'react'

{ PropTypes } = React
{ Button }    = require "react-bootstrap"

TodoActions = require '../../actions/TodoActions.coffee'

module.exports = React.createClass

  propTypes:
   todo: PropTypes.object.isRequired

  render: ->
    <li key={@props.key} className='todo-item col-xs-12'>
      <label className="col-xs-10">{@props.todo.text}</label>
      <Button onClick={@_onDestroy} className="destroy col-xs-2" bsStyle="danger">Delete</Button>
    </li>

  _onDestroy: ->
    TodoActions.destroy @props.todo.id
