
class Time.Views.ClockFaceView extends Backbone.View
  views: {}
  initialize: ->
    children = @$el.children()
    circleEl   = children[0]
    secondsEl  = children[1]
    quadrantEl = children[2]
    dateEl     = children[3]
    degreesEl  = children[4]
    
    @views =
      degrees:   new Time.Views.ClockFace.DegreesView( el: degreesEl )
      seconds:   new Time.Views.ClockFace.SecondsView( el: secondsEl )
      quandrant: new Time.Views.ClockFace.QuadrantView( el: quadrantEl )
      date:      new Time.Views.ClockFace.DateView( el: dateEl )

  render: ->
    view.render() for name, view of @views
