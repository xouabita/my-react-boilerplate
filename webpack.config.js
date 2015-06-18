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

module.exports = backendConfig;
