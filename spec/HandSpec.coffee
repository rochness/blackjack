expect = chai.expect

describe 'dealerHand', ->
  deck = null
  dealersHand = null

  beforeEach ->
    
  it "should check for a bust each time a card is hit", ->
    deck = new Deck()
    dealersHand = new Hand()
    dealersHandView = new HandView collection: dealersHand
    sinon.spy dealersHand, 'bustChecker'
    dealersHand.add(new Card rank: 7, suit: 2)
    dealersHand.add(new Card rank: 7, suit: 3)
    dealersHand.add(new Card rank: 7, suit: 4)
    expect(dealersHand.bustChecker.callCount).to.be.equal(3)

  it "should alert only once when dealer busts", ->
    app = new App()
    appView = new AppView(model: app)
    (app.get 'dealerHand').set [(new Card rank: 7, suit: 2), (new Card rank: 7, suit: 3), (new Card rank: 7, suit: 4)], reset: true
    # sinon.spy dealersHand, 'bustChecker'
    sinon.spy window, 'alert'
    (app.get 'dealerHand').first().flip()
    (app.get 'dealerHand').hit()
    # expect(dealersHand.bustChecker.callCount).to.be.equal(3)
    expect(alert.callCount).to.be.equal(1)