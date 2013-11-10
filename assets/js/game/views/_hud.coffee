class NKO.Views.Hud extends Backbone.View
  template: window.templates.hud_layout
  className: 'hud-layout'

  updateAltitude: (alt) ->
    @$('.altitude').text "#{alt}mi"

  addHeart: ->
    $emptyHeart = @$(".heart.empty").last()
    unless _.isEmpty($emptyHeart)
      $emptyHeart.removeClass('empty').addClass('full')

  removeHeart: ->
    $fullHearts = @$(".heart.full")
    $fullHearts.first().removeClass('full').addClass('empty')

    if $fullHearts.length is 1
      NKO.balloon.trigger("hearts:empty")

  startTimer: ->
    start = new Date
    setInterval =>
      @$('.time').text @_toHHMMSS(Math.round((new Date - start) / 1000))
    , 1000

  onRender: ->
    @startTimer()

  render: ->
    @$el.html @template()
    @onRender()
    this

  _toHHMMSS: (int) ->
    num     = parseInt(int, 10)
    hours   = Math.floor(num/3600)
    minutes = Math.floor((num - (hours*3600)) / 60)
    seconds = num - (hours*3600) - (minutes*60)

    if (minutes < 10) then minutes = "0#{minutes}"
    if (seconds < 10) then seconds = "0#{seconds}"

    "#{minutes}:#{seconds}"
