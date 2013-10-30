class Model extends Backbone.Model
  sync: (method, model, options = {}) ->
    throw new Error("Unimplemented")

class Message extends Model
  sync: (method, model, options = {}) ->
    @["_#{method}"](model, options)

  _create: (model, options) ->
    socket.emit 'newMessage', model
    options.success()

class MessageComposer extends Model
  makeMessage: (data) ->
    new Message(data).save()
