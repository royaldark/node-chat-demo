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
* [express](http://expressjs.com/)
* [async](https://github.com/caolan/async)
* [Less CSS](http://lesscss.org/)

### Client Only
* [jQuery](http://jquery.com)
* [Backbone](http://backbonejs.org)

### Shared
* [IcedCoffeeScript](http://maxtaco.github.io/coffee-script)
* [UnderscoreJS](http://underscorejs.org/)
* [swig](http://paularmstrong.github.io/swig)
* [Socket.IO](http://socket.io/)
