class window.Game extends Backbone.Model
  
  initialize: (deck)->
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @listenTo @get('playerHand'), 'stand', @get('dealerHand').hit.bind @get 'dealerHand'
    @listenTo @get('dealerHand'), 'endGame', @declareWinner

  declareWinner: ->
    if @get('playerHand').score > @get('dealerHand').score then window.alert "Player wins!" else window.alert "Dealer wins!"

