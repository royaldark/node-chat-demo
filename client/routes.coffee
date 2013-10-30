AppRouter = Backbone.Router.extend
  routes: {}

router = new AppRouter()

# Begin route dispatching
Backbone.history.start(pushState: true)
