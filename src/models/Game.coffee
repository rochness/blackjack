class window.Game extends Backbone.Model

  initialize: (deck)->
    @set 'revealed', false
    @set 'winner', null
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()
    @listenTo @get('playerHand'), 'stand', @get('dealerHand').hit.bind @get 'dealerHand'
    @listenTo @get('playerHand'), 'busted', -> @set 'winner', 'Dealer' 
    @listenTo @get('dealerHand'), 'busted', -> @set 'winner', 'Player'
    @listenTo @get('dealerHand'), 'endGame', -> if @get('playerHand').score > @get('dealerHand').score then @set 'winner', 'Player' else @set 'winner', 'Dealer'
    @listenTo @get('playerHand'), 'viewRendered', @declareWinner
    @listenTo @get('dealerHand'), 'viewRendered', @declareWinner


  declareWinner: ->
    if @get 'winner' then window.alert "#{@get 'winner'} wins!"
 
  revealGame: ->
    @set 'revealed', true

