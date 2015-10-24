# TODO: Refactor this model to use an internal Game Model instead
# of containing the game logic directly.
class window.App extends Backbone.Model
  
  initialize: ->
    @set 'chips', 20
    @set 'pot', 0
    @set 'deck', deck = new Deck()
    @set 'game', new Game(deck)

  playGame: ->
    @get('game').revealGame()

