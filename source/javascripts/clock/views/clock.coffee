# Top-level view class: instantiates & renders the other classes.
class Time.Views.ClockView extends Backbone.View
  initialize: ->
    # TODO: re-evaluate making these all global.  Perhaps child views of this class.
    Time.zptRing = new Time.Views.ZptRingView(el: "#_03_ZPT_Fills")
    Time.hourRing = new Time.Views.HourRingView(el: "#ZPT_24_Hours", el2: "#Ring_24_Hours")
    Time.quadrantsRing = new Time.Views.QuadrantsRingView(el: "#ZPT_4_Quarters")
    Time.secondsRing = new Time.Views.SecondsRingView(el: "#ZPT_60_Seconds")
    Time.clockFace = new Time.Views.ClockFaceView(el: "#Face_ZPT_BauhausStd")
    @render()

  render: ->
    Time.clockFace.render()
    Time.secondsRing.render()
    Time.quadrantsRing.render()
    Time.hourRing.render()
    Time.zptRing.render()    