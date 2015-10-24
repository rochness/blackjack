class window.CardView extends Backbone.View
  className: 'card'

  cardStyleTemplate: _.template 'background-image:url("img/cards/<%= rankName.toString().toLowerCase() %>-<%= suitName.toString().toLowerCase() %>.png")'

  template: _.template '<span class=cardText><%= rankName %> of <%= suitName %></span>'

  initialize: -> @render()

  render: ->
    @$el.attr 'style', @cardStyleTemplate @model.attributes
    @$el.children().detach()
    @$el.html @template @model.attributes
    (@$el.removeAttr 'style'
    @$el.addClass 'covered') unless @model.get 'revealed'

