var ExtractTextPlugin = require("extract-text-webpack-plugin");

// Stylus plugins
var nib = require("nib");
var rupture = require("rupture");

var backendConfig = {
  entry: "./server.coffee",
  target: "node",
  context: __dirname,
  output: {
    path: "__build__",
    filename: "server.js",
    libraryTarget: "commonjs2"
  },
  externals: /^[a-z][a-z\.\-0-9]*$/,
  module: {
    loaders: [
      {
        test: /\.coffee$/,
        loader: 'coffee!cjsx',
        exclude: "node_modules"
      }
    ]
  }
}

var webConfig = {
  entry: "./web.coffee",
  output: {
    path: "__build__/public/",
    filename: "app.js"
  },
  resolve: {
    moduleDirectories: ['node_modules']
  },
  module: {
    loaders: [
      {
        test: /\.coffee$/,
        loader: 'coffee!cjsx',
        exclude: "node_modules"
      },
      {
        test: /\.styl$/,
        loader: ExtractTextPlugin.extract('style-loader', 'css-loader!stylus-loader')
      },
      {
        test: /\.(ttf|eot|svg|woff|gif)$/,
        loader: 'file-loader'
      },
      {
        test: /\.woff2?$/,
        loader: 'url-loader?limit=10000&minetype=application/font-woff'
      }
    ]
  },
  stylus: {
    use: [
      nib(),
      rupture()
    ]
  },
  plugins: [
    new ExtractTextPlugin("styles.css")
  ]
}

module.exports = [backendConfig, webConfig];
