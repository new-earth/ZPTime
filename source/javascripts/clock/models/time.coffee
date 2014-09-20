
class Time.Models.TimeModel extends Backbone.Model
  initialize: (jsDate)->
    @setDateTime(jsDate || new Date())
  
  setDateTime: (jsDate)->
    @dateTime = jsDate
    @calculateTime()

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

  calculateTime: ->
    # Giza = UTC + 2
    # 6pm Giza = 0 degrees
    hours = (@dateTime.getUTCHours() + 2) + 6
    hours %= 24
    
    minutes = ((hours * 60) + @dateTime.getUTCMinutes())

    dayMinutes = (24 * 60) # minutes in a day
    degrees = (minutes / dayMinutes) * 360

    degreeRemainder = degrees - Math.floor(degrees) # the decimal part
    quadrant = Math.floor(degreeRemainder * 4) + 1

    @set 
      seconds:  @dateTime.getSeconds()
      quadrant: quadrant
      degrees:  Math.floor(degrees)
      date:     @getDate()
      month:    @dateTime.getUTCMonth() + 1 # js date is 0-based
      year:     @dateTime.getUTCFullYear()

  # This copies the date to a new object. If called a lot, this could be pretty inefficient.
  getDate: ->
    d = new Date(@dateTime + 8*60*60*1000) # 8 hours, in milliseconds
    d.getUTCDate()


