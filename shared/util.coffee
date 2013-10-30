# Import _ on server, but don't let the _ variable be overwritten by
# CoffeeScript on client.
`
if (typeof require == 'function') {
  _ = require('underscore');
}
`

# Monkey-patch some custom fns into Underscore
_.mapObj = _.compose(_.object, _.map)
