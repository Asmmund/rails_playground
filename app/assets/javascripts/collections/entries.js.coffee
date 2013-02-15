class MultipageForm.Collections.Entries extends Backbone.Collection
  url: '/api/entries'
  model: MultipageForm.Models.Entry

  drawWinner: ->
    winner = @shuffle()[0]
    winner.win() if winner

