
 


class AppModel extends Backbone.Model
    
  


    opts : {}
    assets: {}

    preloader : new createjs.LoadQueue true
    manifest : []
 
    constructor: (opts) ->
        super(opts)



    initialize: (opts) => 
        @opts = opts
        @url = opts.url
        super()
        @on 'change' , @onAppModelData
      
 
    onAppModelData: (target) =>
        @off 'change' , @onAppModelData
        @preloader.addEventListener 'progress' , @onPreloadProgress
        @preloader.addEventListener 'complete' , @onPreloadComplete
        @processData()
        @trigger 'dataReady' , @

 
 
    processData: =>
        @searchGlobalAssets(@attributes)
        @preloader.loadManifest(@manifest)



    onPreloadProgress: (e) =>
        console.log  e.loaded * 100
    onPreloadComplete: (e) =>
        @trigger 'assetsReady' , @


    searchGlobalAssets: (object) =>
        for item of object
            if item is "assets"
                for asset of object[item]         
                    

                    if object[item][asset].indexOf("http") is -1
                        object[item][asset] = @get("baseUrl") + object[item][asset]
              
                    @manifest.push(object[item])
                   
            else if typeof object[item] is "object"
                @searchGlobalAssets(object[item])

    


       

module.exports = AppModel   
