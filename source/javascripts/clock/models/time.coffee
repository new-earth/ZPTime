
class Time.Models.TimeModel extends Backbone.Model
  initialize: (jsDate)->
    @setDateTime(jsDate || new Date())
  
  setDateTime: (jsDate)->
    @clearCache()
    @dateTime = jsDate

    @set 
      seconds:  @dateTime.getSeconds()
      quadrant: @getQuadrant()
      degrees:  Math.floor(@getDegrees())
      date:     @getDate()
      month:    @dateTime.getUTCMonth() + 1 # js date is 0-based
      year:     @dateTime.getUTCFullYear()

  # FIXME: This function should get the correct date, accounting 
  # for the moment when one day becomes the next.
  # Currently we are just getting UTC date.
  getDate: ->
    @dateTime.getUTCDate()

  clearCache: ->
    delete @degrees

  tick: =>
    @clearCache()

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
    return @degrees if @degrees? # cached value

    # Giza = UTC + 2
    # 6pm
    hours = @dateTime.getUTCHours() + 2 + 18
    hours %= 24
    
    minutes = ((hours * 60) + @dateTime.getUTCMinutes())

    dayMinutes = (24 * 60)
    degrees = (minutes / dayMinutes) * 360
    @degrees = degrees
    return @degrees


  getQuadrant: ->
    degrees = @getDegrees()
    degreeRemainder = degrees - Math.floor(degrees)
    quadrant = Math.floor(degreeRemainder * 4) + 1
    quadrant
