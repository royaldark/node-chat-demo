# Third-party modules
iced = require 'iced-coffee-script'
less = require 'less'

# Project-specific dependencies
sharedUtil = require '../shared/util.coffee'


Util =
  compile: iced.compile
  
  compileCSS: less.render

module.exports = Util
