
class Time.Models.TimeModel extends Backbone.Model
  initialize: (jsDate)->
    @setDateTime(jsDate || new Date())
  
  setDateTime: (jsDate)->
    @dateTime = jsDate
    @set 
      seconds:  @dateTime.getSeconds()
      quadrant: @getQuadrant()
      degrees:  Math.floor(@getDegrees())
      date:     @dateTime.getUTCDate()
      month:    @dateTime.getUTCMonth() + 1
      year:     @dateTime.getUTCFullYear()

  tick: =>
    secs = @get 'seconds'
    secs += 1
    if secs >= 60
      secs %= 60
      quad = @get 'quadrant'
      quad += 1
      if quad > 4
        quad %= 4
        deg = @get 'degrees'
        deg += 1
        if deg >= 360
          deg %= 360
          # TODO: increment day
        @set degrees: deg
      @set quadrant: quad
    @set seconds: secs

  getDegrees: ->
    # Giza = UTC + 2
    # Noon rather than midnight.
    hours = @dateTime.getUTCHours() + 12 + 2
    hours %= 24
    
    minutes = ((hours * 60) + @dateTime.getUTCMinutes())

    dayMinutes = (24 * 60)
    degrees = (minutes / dayMinutes) * 360
    degrees


  getQuadrant: ->
    degrees = @getDegrees()
    degreeRemainder = degrees - Math.floor(degrees)
    quadrant = Math.floor(degreeRemainder * 4) + 1
    quadrant