Spine            = require('spine')
{Panel}          = require('spine.mobile')

class Intro extends Panel
  className:
    'vision'
    
  events:
    'click .prev': 'prev'   
    'click .next': 'next'   
  elements:
    'video': 'video'
    

    
  constructor: ->
    super

    
    @index = 0
    @footer.html  require('views/intro/vision_footer')(@)
    
    $(window).resize(() =>
       window.location.reload()
    )
    $(window).on("orientationchange", () =>
       window.location.reload()
    )
      

    
  render: =>
    # Calculate currency conversion
    @html require('views/intro/vision')(@)
    @video[0].play();
    
  close: =>
    @popup.hide()
    
  active: (params)->
    @index = parseInt(params.index)

    @render()
    #@log "active", @video[0].className, @index
    @footer.html  require('views/intro/vision_footer')(@)
    super
     
  next: ->
    @log @index,((@index+1)%%5),@index+1
    @navigate('/vision',(@index+1)%5, trans: 'right')
  prev: ->
    @log @index,((@index+4)%%5),@index-1
    @navigate('/vision', (@index+4)%5, trans: 'left')
     

  
module.exports = Intro