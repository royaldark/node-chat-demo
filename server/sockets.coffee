# Third-party dependencies
_ = require 'underscore'

# Project dependencies
MessageManager = require './messages.coffee'

sockets = []

Sockets =
  connect: (socket) ->
    sockets.push socket

    socket.on 'disconnect', Sockets.disconnect

    socket.emit 'messageDigest', MessageManager.lastMessages(10)

    Sockets.setupEvents socket

  disconnect: (socket) =>
    index = sockets.indexOf socket
    sockets.splice index, 1 if index

  setupEvents: (socket) =>
    _.each Sockets.events, (handler, event) ->
      socket.on event, handler

  events:
    newMessage: (message) ->
      MessageManager.add message

      _.each sockets, (socket) ->
        socket.emit 'message', message


module.exports = Sockets
