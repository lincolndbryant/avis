Application =
    initialize: () ->
        
        HomeView = require('views/home_view')
        Step2View = require('views/step2')
        Step3View = require('views/step3')
        Router   = require('lib/router')
        @homeView = new HomeView(el: $('#step1')).render()
        @step2View = new Step2View(el: $('#step2')).render()
        @step3View = new Step3View(el: $('#step3')).render()
        @router   = new Router()
        
        if typeof Object.freeze is 'function' 
        	Object.freeze(@)

module.exports = Application
