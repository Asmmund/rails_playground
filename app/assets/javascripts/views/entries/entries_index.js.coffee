class MultipageForm.Views.EntriesIndex extends Backbone.View
  events:
    'submit #new_entry': 'createEntry'
  template: JST['entries/index']
  initialize: ->
    @collection.on('reset', @render, this)
    @collection.on('add', @appendEntry, this)
  render: ->
    $(@el).html(@template())
    @collection.each(@appendEntry)
    this

  createEntry: (event) ->
    event.preventDefault()
    attributes = name: $('#new_entry_name').val()
    @collection.create attributes,
      success: -> $('#new_entry')[0].reset(),
      error: -> @handleError
  handleError: (entry,responce) ->
    if responce.status == 422
      errors = $.parseJSON( responce.responceText) errors
      for attribute, messages of errors
        alert "#{attribute} #{message}" for message in messages


  appendEntry: (entry)  ->
    view = new MultipageForm.Views.Entry(model: entry)
    $('#entries').append(view.render().el)