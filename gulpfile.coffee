gulp    = require "gulp"
webpack = require "webpack"
nodemon = require "gulp-nodemon"

gulp.task "webpack", (done) ->
  webpack(require "./webpack.config.js").run (err, stats) -> done()

gulp.task "nodemon", ->
  nodemon
    script: '__build__/server.js'
    ext: 'coffee html'
    tasks: ['webpack']

gulp.task "default", ["webpack", "nodemon"]

