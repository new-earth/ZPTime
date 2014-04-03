
class Time.Views.SecondsRingView extends Backbone.View
  initialize: ->
    @model = Time.time

  render: ->
    bbox = @el.getBBox()
    centerX = bbox.x + bbox.width / 2
    centerY = bbox.y + bbox.height / 2

    @$el.attr("transform", "rotate(#{@rotationDegrees()}, #{centerX}, #{centerY})")

  rotationDegrees: ->
    seconds = @model.get 'seconds'
    # SVG image shows 1 second, so we need to subtract 1 from our seconds to rotate the correct amount.
    (seconds - 1) * 360 / 60 # deg / sec
    