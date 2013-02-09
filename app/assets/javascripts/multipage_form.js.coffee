window.MultipageForm =
  Models: {}
  Collections: {}
  Views: {}
  Routers: {}
  initialize: ->
    new MultipageForm.Routers.Entries()
    Backbone.history.start()

$(document).ready ->
  MultipageForm.initialize()
