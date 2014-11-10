do (window = window, document = document, $ = jQuery || {}) ->

  class mAcordion

    constructor: (context) ->
      @acdon = context
      if @acdon.length != 0
        @init()

    init: ->
      swtBtn = @acdon.find('.switcher_btn')
      swtBtn.on 'click', ->
        $(@).toggleClass('active')
               .next().slideToggle()
        return false

  class mSmoothAnc

    constructor: (context) ->
      @ancLink = context

    init: ->
      self = this

      ancease = 'easeOutQuart'
      speed = 400

      @ancLink.on 'click', (e) ->
        href = $(@).attr('href')
        if href != '#' && href.indexOf('#', 0) >= 0
          target   = $(href)
          position = target.offset().top
          bodytop  = $('html,body')
          bodytop.animate
            scrollTop: position
            speed
          return false

  class mRedirect

    publicFunc: ->
      useragent = navigator.userAgent
      iPhone    = useragent.match(/iPhone/)
      iPad      = useragent.match(/iPad/)
      Android   = useragent.match(/Android/)
      mobile    = useragent.match(/Mobile/)

      myurl = location.href
      spurl = myurl.match(/\/sp\//)

      if !iPhone && !Android
        if spurl
          reurl = myurl.replace("/sp/", "/")
          location.href = reurl        

      if iPad
        if spurl
          reurl = myurl.replace("/sp/", "/")
          location.href = reurl


  ##(new mRedirect).publicFunc()
  (new mSmoothAnc $('a[href^=#]')).init()
  (new mAcordion $('.switcher'))

  return
