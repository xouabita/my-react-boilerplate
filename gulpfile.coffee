gulp    = require "gulp"
webpack = require "webpack"
nodemon = require "gulp-nodemon"

gulp.task "webpack", (done) ->
  webpack(require "./webpack.config.coffee").run (err, stats) -> done()

gulp.task "nodemon", ["webpack"], ->
  nodemon
    script: '__build__/server.js'
    ext: 'coffee html styl'
    tasks: ['webpack']

gulp.task "default", ["nodemon"]

