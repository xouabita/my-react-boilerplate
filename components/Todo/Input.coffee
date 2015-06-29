React = require 'react'

{ PropTypes } = React

ENTER_KEY_CODE = 13

module.exports = React.createClass

  propTypes:
    className: PropTypes.string
    id: PropTypes.string
    placeholder: PropTypes.string
    value: PropTypes.string
    onSave: PropTypes.func.isRequired

  getInitialState: ->
    value: @props.value || ''

  render: ->
    <input
      className={@props.className}
      id={@props.id}
      placeholder={@props.placeholder}
      onBlur={this._save}
      onChange={this._onChange}
      onKeyDown={this._onKeyDown}
      value={@state.value}
    />

  _save: ->
    @props.onSave @state.value
    @setState value: ''

  _onChange: (e) -> @setState value: e.target.value

  _onKeyDown: (e) ->
    @_save() if e.keyCode is ENTER_KEY_CODE
