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
        loader: 'coffee-loader',
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
        loader: 'coffee-loader',
        exclude: "node_modules"
      },
      {
        test: /\.styl$/,
        loader: 'style!css!stylus'
      }
    ]
  }
}

module.exports = [backendConfig, webConfig];
