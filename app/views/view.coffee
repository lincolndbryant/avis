require 'lib/view_helper'

#Base class for all views
class BaseView extends Backbone.View
    className: 'view'
    initialize: ->
    template: ->
    getRenderData: ->
    
    render: ->
        debugger
        @$el.html(this.template(this.getRenderData()))
        @afterRender()
        @

    afterRender: ->

module.exports = BaseView