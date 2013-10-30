socket = null

templates = _.mapObj rawTemplates, (content, name) ->
  [name, swig.compile content]

addMessage = (message) ->
  $('.error').empty()
  model = new Message(message)
  view = new MessageView({ model })
  $('#messageArea').prepend(view.render().$el)

$ ->
  masterView = new MasterView()
  $('body').html(masterView.render().$el)
  masterView.addComposer()

  socket = io.connect "http://#{location.host}"

  socket.on 'messageDigest', (messages) ->
    _.each messages, addMessage

  socket.on 'message', addMessage

  socket.on 'error', ->
    errorMsg = 'Error: You appear to have disconnected from the server. Please refresh the page.'
    $('.error').html(errorMsg)
