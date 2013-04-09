application = require('application')

class AppRouter extends Backbone.Router
    routes:
        '': 'home'
        'step2': 'step2'
        'step3': 'step3'
    
    home: ->
        debugger
        $('.view').hide()
        application.homeView.$el.show()

    step2: ->
        $('.view').hide()
        application.step2View.$el.show()

    step3: ->
        $('.view').hide()
        application.step3View.$el.show()

module.exports = AppRouter