const path = require( 'path' )
const webpack = require( 'webpack' )
const MinifyPlugin = require( 'babel-minify-webpack-plugin' )

const resolve = source => path.resolve( __dirname, source )

module.exports = {
  entry: resolve( 'src/entry.js' ),
  resolve: {
    extensions: ['.js']
  },
  module: {
    rules: [{
      test: /\.elm$/,
      exclude: [/elm-stuff/, /node_modules/],
      use: 'elm-webpack-loader'
    }, {
      test: /\.css$/,
      use: ['style-loader', {
        loader: 'css-loader',
        options: {
          minimize: true
        }
      }]
    }, {
      test: /\.html$/,
      exclude: /node_modules/,
      use: [{
        loader: 'file-loader',
        options: {
          name: '[name].[ext]'
        }
      }, 'extract-loader', {
        loader: 'html-loader',
        options: {
          minimize: true
        }
      }]
    }]
  },
  plugins: [
    new MinifyPlugin()
  ],
  output: {
    path: resolve( 'dist/' ),
    filename: 'elm.js'
  }
}
