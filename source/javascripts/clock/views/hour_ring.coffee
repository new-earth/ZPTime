
class Time.Views.HourRingView extends Backbone.View
  initialize: (options)->
    @model = Time.time
    @$el2 = $(options.el2)
    @el2 = @$el2.el

  render: ->
    bbox = @el.getBBox()
    centerX = bbox.x + bbox.width / 2
    centerY = bbox.y + bbox.height / 2

    @$el.attr("transform", "rotate(#{@rotationDegrees()}, #{centerX}, #{centerY})")
    @$el2.attr("transform", "rotate(#{@rotationDegrees()}, #{centerX}, #{centerY})")

  rotationDegrees: ->
    degrees = @model.get 'degrees'
    # SVG is 8 degrees forward from 0
    degrees - 8