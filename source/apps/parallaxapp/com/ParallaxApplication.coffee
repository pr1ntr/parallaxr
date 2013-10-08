AppModel = require './model/AppModel.coffee'
Parallax = require './parallax/Parallax.coffee'
class ParallaxApplication extends Backbone.Router
    
    model : null
    parallax : null

    constructor: () ->
        @initData()



    initData: =>

        
        @model = new AppModel
            url: window.DATA_URL or "/data/data.json"  
        @model.on "assetsReady" , @initApp
        @model.fetch()

    initApp: =>
        console.log "assets ready"
        @parallax = new Parallax "pdread-canvas"


module.exports = ParallaxApplication