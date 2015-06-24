# ~~~~~~~~~~~~~~~~~~~~~
# Requirements
# ~~~~~~~~~~~~~~~~~~~~~

require "bootstrap-styl/bootstrap/index.styl"
style = require "./assets/styles/main.styl"

window.jQuery = window.$ = require 'jquery'

require 'bootstrap-styl/js/affix'
require 'bootstrap-styl/js/alert'
require 'bootstrap-styl/js/button'
require 'bootstrap-styl/js/carousel'
require 'bootstrap-styl/js/collapse'
require 'bootstrap-styl/js/dropdown'
require 'bootstrap-styl/js/modal'
require 'bootstrap-styl/js/tooltip'
require 'bootstrap-styl/js/popover'
require 'bootstrap-styl/js/scrollspy'
require 'bootstrap-styl/js/tab'
require 'bootstrap-styl/js/transition'

React  = require('react')
Router = require('react-router')

routes = require './Routes.coffee'

Router.run routes, Router.HistoryLocation, (Handler) ->
  React.render <Handler />, document.body
