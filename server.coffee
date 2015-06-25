# Node modules
express      = require 'express'
mongoose     = require 'mongoose'
passport     = require 'passport'
bodyParser   = require 'body-parser'
cookieParser = require 'cookie-parser'
session      = require 'express-session'

# React stuff
React  = require 'react'
Router = require 'react-router'

# Passport strategies
LocalStrategy = require('passport-local').Strategy

app = express()

app.set 'views', "./views/"
app.engine 'html', require('ejs').renderFile
app.set 'view engine', 'html'

app.use bodyParser.json()
app.use bodyParser.urlencoded extended: yes
app.use session secret: 'my react boilerplate'
app.use cookieParser()

app.use passport.initialize()
app.use passport.session()

User = require './models/User.coffee'
passport.use new LocalStrategy(User.authenticate())
passport.serializeUser User.serializeUser()
passport.deserializeUser User.deserializeUser()

mongoose.connect 'mongodb://localhost/my_react_boilerplate'

app.use '/static', express.static './__build__/public/'

# Routes managed by express and not by react-router
app.post '/register', (req, res) ->
  User.register new User(username: req.body.username)
  , req.body.password
  , (err, user) ->
      if err then console.log err;res.redirect '/register'
      passport.authenticate('local') req, res, -> res.redirect '/test-login'

app.post '/login', passport.authenticate('local'), (req, res) ->
  res.redirect '/test-login'

app.get '/logout', (req, res) ->
  req.logout()
  res.redirect '/test-login'

# Routes managed by react-router
routes = require './Routes.coffee'
app.use (req, res, next) ->
  router = Router.create
    location: req.url
    routes: routes
  router.run (Handler, state) ->
    initialState = {}
    if req.user then initialState['user'] = req.user
    html = React.renderToString <Handler initialState={initialState} />
    res.render 'base.html',
      react: html
      state: JSON.stringify initialState

app.listen 4242, ->
  console.log "Your app is now running on port 4242"
