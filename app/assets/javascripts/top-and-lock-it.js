var topAndLockIt = function(jQueryElement, interpolations) {
  var jQueryDocument              = $(document)
  var defaultOffsetTop            = jQueryElement.offset().top
  var originalPosition            = jQueryElement.css("position")
  var originalTop                 = jQueryElement.css("top")
  var originalMarginTop           = jQueryElement.css("margin-top")
  var originalInterpolationValues = {}

  var eachKeyValue = function(a, f) {
    for(var attribute in a) {
      if(a.hasOwnProperty(attribute)) f(attribute, a[attribute])
    }
  }

  var fixToTop = function() {
    jQueryElement.css("position",   "fixed")
    jQueryElement.css("top",        0)
    jQueryElement.css("margin-top", 0)
  }

  var reset = function() {
    jQueryElement.css("position",   originalPosition)
    jQueryElement.css("top",        originalTop)
    jQueryElement.css("margin-top", originalMarginTop)
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

    if(scrollDistanceFromDefault <= 0) {
      fixToTop()
    } else {
      reset()
      interpolate(percentDelta)
    }
  })
}
