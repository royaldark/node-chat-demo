sampleMessage =
  message: 'sample message'
  time: new Date().getTime()
  name: 'bob'

messages = [sampleMessage]

MessageManager =
  add: (message) ->
    messages.push message

  lastMessages: (n) ->
    start = Math.max 0, MessageManager.messageCount() - n
    messages[start..]

  messageCount: ->
    messages.length

module.exports = MessageManager
