# Node modules
express  = require 'express'
mongoose = require 'mongoose'
passport = require 'passport'

# React stuff
React  = require 'react'
Router = require 'react-router'

# Passport strategies
LocalStrategy = require('passport-local').Strategy

app = express()

app.set 'views', "./views/"
app.engine 'html', require('ejs').renderFile
app.set 'view engine', 'html'

app.use passport.initialize()
app.use passport.session()

User     = require './models/User.coffee'
passport.use new LocalStrategy(User.authenticate())
passport.serializeUser User.serializeUser()
passport.deserializeUser User.deserializeUser()

mongoose.connect 'mongodb://localhost/my_react_boilerplate'

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
