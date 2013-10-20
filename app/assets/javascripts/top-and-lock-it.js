var topAndLockIt = function(jQueryElement, top_stop_for_the_pop_and_lock, interpolations) {
  var jQueryDocument              = $(document)
  var defaultOffsetTop            = jQueryElement.offset().top
  var originalPosition            = jQueryElement.css("position")
  var originalTop                 = jQueryElement.css("top")
  var originalMarginTop           = jQueryElement.css("margin-top")
  var originalInterpolationValues = {}
  var placeholder                 = null

  var eachKeyValue = function(a, f) {
    for(var attribute in a) {
      if(a.hasOwnProperty(attribute)) f(attribute, a[attribute])
    }
  }

  var fixToTop = function() {
    var originalLeft = jQueryElement.offset().left
    if (!placeholder)
    {
      placeholder = $('<div>', { width: jQueryElement.width(), height: jQueryElement.height() })
      jQueryElement.after(placeholder)
    }
    jQueryElement.css("position",   "fixed")
    jQueryElement.css("top",        top_stop_for_the_pop_and_lock)
    jQueryElement.css("left",       originalLeft)
    jQueryElement.css("margin-top", 0)
  }

  var reset = function() {
    jQueryElement.css("position",   originalPosition)
    jQueryElement.css("top",        originalTop)
    jQueryElement.css("left",       "")
    jQueryElement.css("margin-top", originalMarginTop)
    if (placeholder) {
      placeholder.remove()
      placeholder = null
    }
  }

  var interpolate = function(percentOfOriginalValue) {
    eachKeyValue(interpolations, function(key, finalValue) {
      var interpolatedOriginal = percentOfOriginalValue * originalInterpolationValues[key]
      var interpolatedFinal    = (1.0 - percentOfOriginalValue) * interpolations[key]
      jQueryElement.css(key, interpolatedOriginal + interpolatedFinal)
    })
  }

  eachKeyValue(interpolations, function(key, value) {
    originalInterpolationValues[key] = parseFloat(jQueryElement.css(key), 10)
  })

  $(window).scroll(function() {
    if(defaultOffsetTop <= 0) {
      fixToTop()
      return
    }

    var scrollDistanceFromDefault = defaultOffsetTop - jQueryDocument.scrollTop()
    var percentDelta              = Math.max(scrollDistanceFromDefault / defaultOffsetTop, 0)

    if(scrollDistanceFromDefault <= top_stop_for_the_pop_and_lock) {
      fixToTop()
    } else {
      if(scrollDistanceFromDefault > 0) {
        reset()
        if (percentDelta <= 1) {
          interpolate(percentDelta)
        }
      }
    }
  })
}
