#Backbone Requires
window._ = require('underscore');
window.Backbone = require('backbone');
Backbone.$ = $;

#Greensock Requires
require("./include/greensock/TweenLite.min.js")
require("./include/greensock/TweenMax.min.js")
require("./include/greensock/easing/EasePack.min.js")


window.createjs = window.createjs or {}
#Create JS Requires
#Canvas Lib
require("./include/create/easeljs-0.7.0.min.js")
#Preloader Lib
require("./include/create/preloadjs-0.4.0.min.js")



#Call Main App File
ParallaxApplication = require("./com/ParallaxApplication.coffee")





if typeof Array.isArray isnt "function"
  Array.isArray = (arr) ->
    Object::toString.call(arr) is "[object Array]"

    
window.urlParam = (name) ->
    name = name.replace(/[\[]/, "\\[").replace(/[\]]/, "\\]")
    regexS = "[\\?&]" + name + "=([^&#]*)"
    regex = new RegExp(regexS)
    results = regex.exec(window.location.href)
    unless results?
    	undefined 
    else
   		results[1]
 
 
if window.console is undefined or window.console is null
    window.console =
        log: ->
        warn: ->
        fatal: ->




$(document).ready ->
    app = new ParallaxApplication()