class @Icons

  constructor: ->

    @bindEvents()

  bindEvents: ->
    $(".glyphs.css-mapping input").each ->
      val = $(this).val()
      $(this).val('.icon-' + val)
