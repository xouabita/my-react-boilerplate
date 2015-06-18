express = require 'express'
React   = require 'react'
Router  = require 'react-router'

app = express()

app.set 'views', "./views/"
app.engine 'html', require('ejs').renderFile
app.set 'view engine', 'html'


app.use '/static', express.static './__build__/public/'

# Routes managed by react-router
routes = require './Routes.coffee'
app.use (req, res, next) ->
  router = Router.create
    location: req.url
    routes: routes
  router.run (Handler, state) ->
    res.render 'base.html', react: React.renderToString <Handler />

app.listen 4242, ->
  console.log "Your app is now running on port 4242"
