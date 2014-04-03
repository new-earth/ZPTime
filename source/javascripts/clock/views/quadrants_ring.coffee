
class Time.Views.QuadrantsRingView extends Backbone.View
  initialize: ->
    @model = Time.time

  render: ->
    bbox = @el.getBBox()
    centerX = bbox.x + bbox.width / 2
    centerY = bbox.y + bbox.height / 2

    @$el.attr("transform", "rotate(#{@rotationDegrees()}, #{centerX}, #{centerY})")

  rotationDegrees: ->
    quadrant = @model.get 'quadrant'
    # q1 = 0 deg
    # q2 = 90 deg
    # q3 = 180 deg
    # q4 = 270 deg
    (quadrant - 1) * 90