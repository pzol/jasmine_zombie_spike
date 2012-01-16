beforeEach ->
  @addMatchers {

    toSeeLink: (text) ->
      @message = -> "Could not find link #{text} in \n#{@actual.session.html()}"
      for a in @actual.session.querySelectorAll('body a')
        regex = new RegExp(text)
        if regex.test(a.textContent.trim())
          return true
      return false


    toSee: (text) ->
      @message = -> "Could not find #{text} in \n#{@actual.session.html()}"
      regex = new RegExp(text)
      regex.test(@actual.session.html())

  } 
  return
