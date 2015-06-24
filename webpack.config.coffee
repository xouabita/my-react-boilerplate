ExtractTextPlugin = require "extract-text-webpack-plugin"

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
  entry: "./web.coffee"
  output:
    path: "__build__/public/"
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
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader!stylus-loader')
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
    new ExtractTextPlugin("styles.css")
  ]

module.exports =
  frontendConfig: frontendConfig
  backendConfig: backendConfig
