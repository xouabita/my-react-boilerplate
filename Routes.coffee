React  = require 'react'
Router = require 'react-router'
{ Route, DefaultRoute } = Router

# Views
Index     = require './views/Index.coffee'
Hello     = require './views/Hello.coffee'
Register  = require './views/Register.coffee'
Login     = require './views/Login.coffee'
TestLogin = require './views/TestLogin.coffee'
Todo      = require './views/Todo.coffee'

module.exports =
  <Route path="/">
    <DefaultRoute handler={Index} />
    <Route path="/hello/:name" handler={Hello} />
    <Route path="/register" handler={Register} />
    <Route path="/login" handler={Login} />
    <Route path="/test-login" handler={TestLogin} />
    <Route path="/todo" handler={Todo} />
  </Route>
