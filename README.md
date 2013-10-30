Node Chat Demo
==============

A hastily-assembled demo of a chat application built using Node, CoffeeScript and Backbone.

I used this demo to conclude my Bits & Bytes talk at the University of Minnesota Morris on October 30, 2013.

Keep in mind that although I aimed for relatively clean code, this application *was* thrown together the day before the talk. As such, the code undoubtedly contains bugs, unhandled errors, and bad design decisions.


How to Run
----------

To run this demo, you will first need to install IcedCoffeeScript globally with npm: `npm install -g iced-coffee-script`.

Then simply run `iced server.coffee`.


Directory Structure
-------------------

* client/ - My own client-side code
    * css/ - My LESS CSS code
    * js/ - Third-party client-side libraries
* node_modules/ - Third-party server-side libraries
* server/ - My own server-side code
* shared/ - My own code shared between client and server. Mostly just utilities
* templates / - HTML templates used client-side. Probably could be moved into client/


What Libraries Are Used?
------------------------

Here's a list of the libraries and modules included.

### Server Only
* [express](http://expressjs.com/) - Web server framework
* [async](https://github.com/caolan/async) - Asynchronous control flow
* [Less CSS](http://lesscss.org/) - Dynamic stylesheets

### Client Only
* [jQuery](http://jquery.com) - DOM manipulation, utilities
* [Backbone](http://backbonejs.org) - MVC, client-server sync, HTML5 pushState routing

### Shared
* [IcedCoffeeScript](http://maxtaco.github.io/coffee-script) - CoffeeScript with built-in async control flow constructs
* [UnderscoreJS](http://underscorejs.org/) - Utilities
* [swig](http://paularmstrong.github.io/swig) - Templating engine
* [Socket.IO](http://socket.io/) - WebSockets library with graceful degradation
