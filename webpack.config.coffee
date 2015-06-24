ExtractTextPlugin = require "extract-text-webpack-plugin"
{ HotModuleReplacementPlugin } = require 'webpack'


# Stylus plugins
nib     = require "nib"
rupture = require "rupture"


backendConfig =
  entry: "./server.coffee"
  target: "node"
  context: __dirname
  output:
    path: "__build__"
    filename: "server.js"
    libraryTarget: "commonjs2"
  externals: /^[a-z][a-z\.\-0-9]*$/
  module:
    loaders: [
        test: /\.coffee$/,
        loader: 'coffee!cjsx',
        exclude: "node_modules"
    ]

frontendConfig =
  entry: ["./web.coffee", "webpack/hot/dev-server"]
  output:
    path: __dirname + "/__build__/public/"
    publicPath: "http://localhost:4243/"
    filename: "app.js"
  resolve:
    moduleDirectories: ['node_modules']
  module:
    loaders: [
        test: /\.coffee$/,
        loader: 'coffee!cjsx',
        exclude: "node_modules"
      ,
        test: /\.styl$/,
        loader: 'style!css!stylus'
      ,
        test: /\.(ttf|eot|svg|woff|gif)$/,
        loader: 'file-loader'
      ,
        test: /\.woff2?$/,
        loader: 'url-loader?limit=10000&minetype=application/font-woff'
    ]
  stylus:
    use: [
      nib()
      rupture()
    ]
  plugins: [
    new HotModuleReplacementPlugin()
  ]

module.exports =
  frontendConfig: frontendConfig
  backendConfig: backendConfig
