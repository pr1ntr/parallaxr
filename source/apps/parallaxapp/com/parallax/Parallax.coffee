

class Parallax extends createjs.Stage
    

    uiOverlay: null
        
    screenWidth: null
    screenHeight: null
    scrollDirection: null
    
    _mouseDown: false
    _throw: false
    _parallaxLayers: {}
    _model: {}
    
    _xCurrent: 0
    _xLast: 0
    _speed: 5
    _friction: .75
    
    _msX: {}
    _offset: {}

    _lock: false
    hotspots: []
    overlay : null


    constructor: (canvas) ->
        super(canvas)
        @initialize(canvas)

    initialize: (canvas) ->

        @screenWidth = canvas.width
        @screenHeight = canvas.height
        super(canvas)
        @enableMouseOver()
        @mouseEventsEnabled = true

    isCanvasSupported: (canvas) ->
        elem = canvas;
        return !!(elem.getContext && elem.getContext('2d'));
        
        

module.exports = Parallax

