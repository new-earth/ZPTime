
class Time.Views.ClockFace.DateView extends Backbone.View
  initialize: ->
    @model = Time.time

  render: ->
    # @$el.text(@model.get('date').lpad(2) + @model.get('month').lpad(2) + @model.get('year').toString().slice(2))
