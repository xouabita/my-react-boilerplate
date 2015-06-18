express = require 'express'

app = express()

app.set 'views', "./views/"
app.engine 'html', require('ejs').renderFile
app.set 'view engine', 'html'

app.get "/", (req, res) ->
  res.render 'base.html', react: "Hello, World"
app.get "/hello/:name", (req, res) ->
  res.render 'base.html', react: "Hello #{req.params.name}!"

app.listen 4242
