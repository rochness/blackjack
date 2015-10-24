class window.CardView extends Backbone.View
  className: 'card'

  template: _.template '<span class=cardText><%= rankName %> of <%= suitName %></span>'

  initialize: -> @render()

  render: ->
    @$el.children().detach()
    @$el.html @template @model.attributes
    @$el.addClass 'covered' unless @model.get 'revealed'

