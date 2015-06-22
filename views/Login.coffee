React     = require 'react'
Page      = require '../components/Page.coffee'
Router    = require 'react-router'
Bootstrap = require 'react-bootstrap'

{ Link }               = Router
{ Input, ButtonInput } = Bootstrap

module.exports = React.createClass
  render: ->
    <Page>
      <form className="form-horizontal">
        <h3>Login</h3>
        <Input type="text" label="Username" placeholder="Username..." labelClassName="col-xs-2" wrapperClassName="col-xs-10"/>
        <Input type="password" label="Password" placeholder="Password..." labelClassName="col-xs-2" wrapperClassName="col-xs-10"/>
        <ButtonInput type='submit' value='Login' className="col-xs-12" />
      </form>
    </Page>
