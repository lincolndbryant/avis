View = require('./view')
Models = require('models/model')
template = require('./templates/home')
sidebar = require('./templates/rental_summary')

class Step3View extends View
    template: template

    render: ->
        super()
        debugger
        @extras = new Models.ExtraCollection(Models.ExtraData)
        @extras.each (extra) =>
            extra.on('change', @.onChange, @)
            extraView = new ExtraView(model: extra)
            @$('#primary').append(extraView.render().el)
        @renderSidebar()
        @

    onChange: (model, opts) ->
        @renderSidebar()

    renderSidebar: ->
        context = 
            duration: 1
            total_rate: 48.50
            taxes_total: 13.50
        extras = @extras.enabled()
        extras = _.map(extras, (e) -> e.toJSON())
        context.extras = extras
        context.extras_total = @extras.total()
        console.log(context)
        @$('#sidebar').html(sidebar(context))
        
class ExtraView extends View
    tagName: 'div'
    className: 'extra'

    events:
        'change input': 'toggle'

    render: ->
        @$el.append($('<input type="checkbox" />'))
        @$el.append($('<label>' + @model.get('name') + '</label>'))
        @

    toggle: ->
        @model.set('enabled', @$('input').is(':checked'))

module.exports = Step3View
