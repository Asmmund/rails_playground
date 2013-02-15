
class MultipageForm.Routers.Entries extends Backbone.Router
  routes:
    '':'index'
    'entries/:id': 'show'
  initialize: ->
    @collection = new MultipageForm.Collections.Entries()
    @collection.reset($('#container').data('entries'))
  index: ->
    view = new MultipageForm.Views.EntriesIndex( collection: @collection)
    $('#container').html(view.render().el)
  show: (id) ->
    write_div "entry #{id}"



  write_div = (message) ->
    $('#container').html("#{message}")
