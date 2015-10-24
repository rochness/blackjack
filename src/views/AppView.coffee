class window.AppView extends Backbone.View

  id: 'hjgjh'
  # events:
  #   'click .hit-button': -> @model.get('playerHand').hit()
  #   'click .stand-button': -> @model.get('playerHand').stand()

  initialize: ->
    @render()

  render: ->
    @$el.children().detach()
    @$el.append (new GameView model: @model.get 'game').el
    

