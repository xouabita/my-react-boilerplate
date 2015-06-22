React  = require 'react'
Router = require 'react-router'
{ Route, DefaultRoute } = Router

# Views
Index    = require './views/Index.coffee'
Hello    = require './views/Hello.coffee'
Register = require './views/Register.coffee'

module.exports =
  <Route path="/">
    <DefaultRoute handler={Index} />
    <Route path="/hello/:name" handler={Hello} />
    <Route path="/register" handler={Register} />
  </Route>
