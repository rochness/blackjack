class window.AppView extends Backbone.View

  events:
    'submit .bet': (event)-> 
      event.preventDefault()
      bet = Number event.target[0].value
      @model.set 'pot', 2 * bet
      @model.set 'chips', (@model.get 'chips') - bet
      $(@$el.children('.bet').addClass 'hideBet'
      @model.playGame()
  #   'click .stand-button': -> @model.get('playerHand').stand()

  template: _.template '<div>
                          <div class=bet><form>Enter bet for next game: <input type="text"></form></div>
                          <div class=chips>Your chips: <%= chips %></div>
                          <div class=pot>Pot: <%= pot %></div>
                        </div>'

  initialize: ->
    @render()
    @model.on 'change:chips', @render, @

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.append (new GameView model: @model.get 'game').el
    

