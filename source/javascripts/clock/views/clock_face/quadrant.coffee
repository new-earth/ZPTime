
class Time.Views.ClockFace.QuadrantView extends Backbone.View

  initialize: ->
    @model = Time.time

  render: ->
    @$el.text @model.get('quadrant')