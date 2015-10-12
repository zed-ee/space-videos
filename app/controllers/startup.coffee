Spine            = require('spine')
{Panel}          = require('spine.mobile')

class Intro extends Panel
  className:
    'startup'
    
  events:
    'click div.video': 'next'
  constructor: ->
    super

    @render()
  
  render: =>
    # Calculate currency conversion
    @html require('views/intro/index')(@)
    
  next: (e) ->
    index = $( "div.video" ,@el).index( e.target )
    @navigate('/intro', index, trans: 'right')
module.exports = Intro