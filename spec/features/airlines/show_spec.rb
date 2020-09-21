require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit an airlines show page' do
    it 'I see a unique list of passengers that have flights from that airline' do
      @airline = Airline.create!(name: 'Frontier')

      @pas_1 = Passenger.create!(name: "Pas 1", age: 5)
      @pas_2 = Passenger.create!(name: "Pas 2", age: 10)
      @pas_3 = Passenger.create!(name: "Pas 3", age: 15)
      @pas_4 = Passenger.create!(name: "Pas 4", age: 20)

      @flight_1 = Flight.create!(number: 36012, airline: @airline)
      @flight_2 = Flight.create!(number: 50239, airline: @airline)
      @flight_3 = Flight.create!(number: 12353, airline: @airline)

      PassengerFlight.create!(passenger: @pas_1, flight: @flight_1)
      PassengerFlight.create!(passenger: @pas_1, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_2, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_3, flight: @flight_3)

      visit "/airlines/#{@airline.id}"

      expect(page).to have_content(@pas_1.name)
      expect(page).to have_content(@pas_2.name)
      expect(page).to have_content(@pas_3.name)
      expect(page).to_not have_content(@pas_4.name)
    end
  end
end
