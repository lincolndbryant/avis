View     = require('./view')
template = require('./templates/home')
sidebar  = require('./templates/step1_sidebar')

class HomeView extends View
    template: template

    events:
        'change input[name=dropoff_at_pickup]': 'toggleDropoffAtPickup'
        'click .submit': 'submit'

    render: ->
        super()
        Models = require('models/model')
        @model = new Models.Step1Model()
        @form = new Backbone.Form({model: @model})
        @$('#primary').html(@form.render().el)
        @$('#sidebar').html(sidebar())
        @form.$el.submit(()-> false).append($('<button class="submit">Next</button>'))
        @toggleDropoffAtPickup()
        @

    toggleDropoffAtPickup: ->
        if @$('input[name=dropoff_at_pickup]').is(':checked')
            @$('input[name=dropoff_location]').hide()
        else
            @$('input[name=dropoff_location]').show()

    submit: (e) ->
        console.log('submit')
        debugger
        fields = @$('form').serializeArray()
        for field in fields
            @model.set(field.name, field.value)
        document.location = '#step2'
        false

module.exports = HomeView
