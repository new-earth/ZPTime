
class Time.Views.ZptRingView extends Backbone.View
  initialize: ->
    @model = Time.time

  render: ->
    bbox = @el.getBBox()
    centerX = bbox.x + bbox.width / 2
    centerY = bbox.y + bbox.height / 2

    @$el.attr("transform", "rotate(#{@rotationDegrees()}, #{centerX}, #{centerY})")

  rotationDegrees: ->
    degrees = @model.get 'degrees'
    degrees
