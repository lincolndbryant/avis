View = require('./view')
Models = require('models/model')
template = require('./templates/home')
sidebar = require('./templates/rental_info')

class Step2View extends View
    template: template

    render: ->
        super()
        cars = new Models.CarCollection(Models.CarData)
        cars.each (car) =>
            carView = new CarView(model: car, parent: @)
            @$('#primary').append(carView.render().el)
        @.renderSidebar()
        @

    renderSidebar: ->
        context = 
            duration: 1
            total_rate: 48.50
        if @model
            context.car = @model.toJSON()
        @$('#sidebar').html(sidebar(context))

    select: (car) ->
        @model = car
        @renderSidebar() 
        
class CarView extends View
    tagName: 'div'
    className: 'car'

    events:
        'click': 'select'

    render: ->
        @$el.append(this.model.get('make') + ' - ' + this.model.get('model'))
        @

    select: ->
        @options.parent.select(@.model)



module.exports = Step2View
