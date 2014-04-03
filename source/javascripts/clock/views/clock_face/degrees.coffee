
class Time.Views.ClockFace.DegreesView extends Backbone.View
  initialize: ->
    @model = Time.time

  render: ->
    @$el.text @model.get('degrees').lpad(3)

