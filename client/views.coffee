class SwigTemplateView extends Backbone.View
  fillTemplate: (data = {}) ->
    templateData = _.extend {}, @model?.toJSON(), data
    @$el.append templates[@template](templateData)

  render: (data) =>
    @fillTemplate(data)
    @

class MasterView extends SwigTemplateView
  tagName: 'div'
  template: 'master'

  addComposer: ->
    composerView = new MessageComposerView({ model: new MessageComposer() })
    @$("#composerArea").html(composerView.render().$el)

class MessageView extends SwigTemplateView
  tagName: 'div'
  className: 'message'
  template: 'message'

  render: ->
    # Overwrite the time field since the model stores it as a Unix timestamp
    data =
      time: new Date(@model.get 'time').toLocaleString()

    # And now let the regular render() method take over
    super(data)

class MessageComposerView extends SwigTemplateView
  tagName: 'div'
  template: 'composer'

  events:
    'click .composer-submit': 'submit'

  submit: ->
    $messageEl = @$('.composer-message')

    data =
      name: @$('.composer-name').val()
      time: new Date().getTime()
      message: $messageEl.val()

    @model.makeMessage data

    $messageEl.val("").focus()
