gulp    = require "gulp"
webpack = require "webpack"
nodemon = require "gulp-nodemon"

{ frontendConfig, backendConfig } = require './webpack.config.coffee'

gulp.task "webpack-backend", (done) ->
  webpack(backendConfig).run (err, stats) -> done()

gulp.task "webpack-frontend", ->
  webpack(frontendConfig).watch {}, ->

gulp.task "nodemon", ["webpack-backend"], ->
  nodemon
    script: '__build__/server.js'
    ext: 'coffee'
    tasks: ['webpack-backend']

gulp.task "default", ["nodemon", "webpack-frontend"]

