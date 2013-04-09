class Step1Model extends Backbone.Model
    schema:
        name: 
            type: 'Text'
        from: 
            type: 'Date'
        to: 
            type: 'Date'
        pickup_location:      
            type: 'Text'
        dropoff_at_pickup:      
            type: 'Checkbox'
        dropoff_location:      
            type: 'Text'

CarData = [
    {
        make: 'Subaru', model: 'Outback', color: 'Red', price_per_day: 20
    },
    {
        make: 'Subaru', model: 'Impreze', color: 'Green', price_per_day: 18
    },  
]

class Car extends Backbone.Model
    
class CarCollection extends Backbone.Collection
    model = Car

ExtraData = [
    { name: 'GPS Navigation', price_daily: 14.95 },
    { name: 'XM Radio', price_daily: 4.95 },
    { name: 'Child Safety Seat', price_daily: 10.95 },
]

class Extra extends Backbone.Model

class ExtraCollection extends Backbone.Collection
    model = Extra

    enabled: () ->
        @.filter (extra) -> extra.get('enabled')

    total: () ->
        _total = 0
        for model in @enabled()
            _total += model.get('price_daily')
        _total

module.exports = 
    Step1Model: Step1Model
    Car: Car
    CarData: CarData
    CarCollection: CarCollection
    Extra: Extra
    ExtraData: ExtraData
    ExtraCollection: ExtraCollection