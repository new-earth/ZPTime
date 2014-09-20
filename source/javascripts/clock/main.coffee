window.Time =
  Models: {}
  Collections: {}
  Views: {
    ClockFace: {}
  }
  Routers: {}
  init: ->
    # d = new Date("2014-03-20 23:00 UTC")
    @time = new Time.Models.TimeModel()
    @startClock()

    host = if document.location.hostname == 'localhost' then '' else 'http://time.newearthnation.org'
    d3.xml "#{host}/images/ZPTime.svg", "image/svg+xml", (xml)->
      $(".zptime-clock").append(xml.documentElement)
      Time.clock = new Time.Views.ClockView()


  startClock: ->
    @interval = setInterval =>
      Time.time.tick()
      Time.clock.render()
    , 1000
  
  stopClock: ->
    clearInterval @interval


$(document).ready ->
  Time.init();


# -- Utilities --

Number.prototype.lpad = (size)->
  str = String(@)
  str = '0' + str while str.length < size
  str

