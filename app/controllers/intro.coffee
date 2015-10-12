Spine            = require('spine')
{Panel}          = require('spine.mobile')

class Intro extends Panel
  className:
    'intro'
   events:
    'click .back': 'back'   
    'click .play': 'next'   
    
  constructor: ->
    super
    
   
    
  render: =>
    @html require('views/intro/vision_info')(@)
    

  active: (params)->
    @log "active"
    @index = params.index
    @render()
    super
     
  next: ->
     @navigate('/vision', @index, trans: 'right')
  back: ->
     @navigate('/', trans: 'left')
     

    

module.exports = Intro
