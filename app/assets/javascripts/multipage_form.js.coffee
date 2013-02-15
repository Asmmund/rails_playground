window.MultipageForm =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new MultipageForm.Routers.Entries()
    Backbone.history.start(pushState: true)

$(document).ready ->
  MultipageForm.initialize()
