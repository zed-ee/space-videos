require('lib/setup')

Spine   = require('spine')
{Stage} = require('spine.mobile')
{Panel}          = require('spine.mobile')
Startup = require('controllers/startup')
Intro = require('controllers/intro')
Vision = require('controllers/vision')

class App extends Stage.Global
  events:
    'click .set_lang': 'set_lang'   
    'click .restart': 'restart'   
  
  set_lang: (e) =>
    lang = if window.lang == 'en' then 'et' else 'en'
    top.location.href= top.location.pathname + "?" + lang
    
  restart: (e) =>
    #@navigate('/', trans: 'right')
    window.location.reload(true)

  constructor: (params)->
    lang = location.search || "?et"
    window.lang = lang.substr(1)  
    super
    @mic = null
    #@header.append(@spectrum)
    @app_data = params.data
    @startup = new Startup
    @intro = new Intro
    @vision = new Vision


    @startup.active()
    
    @routes
      '/':        (params) -> @startup.active(params)
      '/en':        (params) -> @startup.active(params)
      '/et':        (params) -> @startup.active(params)
      '/animals':        (params) -> @animals.active(params)
      '/vision/:index':        (params) -> @vision.active(params)
      '/intro/:index':        (params) -> @intro.active(params)
      
    #@footer.html require('views/intro/footer')
    #@navigate('/vision/2', trans: 'right')
       
module.exports = App