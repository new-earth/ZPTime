
class Time.Views.ClockFace.SecondsView extends Backbone.View

  initialize: ->
    @model = Time.time

  render: ->
    @$el.text @model.get('seconds').lpad(2)