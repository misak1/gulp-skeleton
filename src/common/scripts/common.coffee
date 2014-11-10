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

  class mRedirect

    publicFunc: ->
      useragent = navigator.userAgent
      iPhone    = useragent.match(/iPhone/)
      Android   = useragent.match(/Android/)
      mobile    = useragent.match(/Mobile/)

      myurl = location.href
      spurl = myurl.match(/\/sp\//)

      if iPhone
        if !spurl
          reurl = myurl.replace("/", "/sp/")
          location.href = reurl

      if Android && mobile
        if !spurl
          reurl = myurl.replace("/", "/sp/")
          location.href = reurl


  ##(new mRedirect).publicFunc()
  (new mAcordion $('.switcher'))

  return
