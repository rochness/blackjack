class window.Hand extends Backbone.Collection
  model: Card
 
  score: 0

  initialize: (array, @deck, @isDealer) ->

  hit: ->
    @add(@deck.pop())
    @last()


  hasAce: -> @reduce (memo, card) ->
    if card.get 'revealed'
      memo or card.get('value') is 1
    else memo
  , 0

  minScore: -> @reduce (score, card) ->
    score + if card.get 'revealed' then card.get 'value' else 0
  , 0

  scores: ->
    # The scores are an array of potential scores.
    # Usually, that array contains one element. That is the only score.
    # when there is an ace, it offers you two scores - the original score, and score + 10.
    scores = [@minScore(), @minScore() + 10 * @hasAce()]
    @score = if scores[1] > scores[0] and scores[1] <= 21 then scores[1] else scores[0]
    @score

  bustChecker: ->
    if @score > 21 
      winner = (if @isDealer then 'Player' else 'Dealer') 
      alert "#{winner} wins!"


