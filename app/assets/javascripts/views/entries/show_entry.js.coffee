class MultipageForm.Views.ShowEntry extends Backbone.View
  template: JST['entries/entry']

  initialize: (id)->
    @collection = new MultipageForm.Collections.Entries()
    @collection.reset($('#container').data('entries'))
    @model = @collection.get(id)
  render: ->
    $(@el).html(@template(entry: @model))
    this