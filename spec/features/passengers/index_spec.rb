require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit a passengers index page' do
    before :each do
      @airline = Airline.create!(name: 'Frontier')

      @pas_1 = Passenger.create!(name: "Pas 1", age: 5)
      @pas_2 = Passenger.create!(name: "Pas 2", age: 10)
      @pas_3 = Passenger.create!(name: "Pas 3", age: 15)

      @flight_1 = Flight.create!(number: 36012, airline: @airline)
      @flight_2 = Flight.create!(number: 50239, airline: @airline)
      @flight_3 = Flight.create!(number: 12353, airline: @airline)

      PassengerFlight.create!(passenger: @pas_1, flight: @flight_1)
      PassengerFlight.create!(passenger: @pas_1, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_2, flight: @flight_1)
      PassengerFlight.create!(passenger: @pas_2, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_2, flight: @flight_3)
      PassengerFlight.create!(passenger: @pas_3, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_3, flight: @flight_3)

      visit '/passengers'
    end

    it 'I see names of all passengers' do
      expect(page).to have_content(@pas_1.name)
      expect(page).to have_content(@pas_2.name)
      expect(page).to have_content(@pas_3.name)
    end

    it 'next to the passengers name, I see the number of flights that the passenger has' do
      expect(page.all('li')[0]).to have_content(2)
      expect(page.all('li')[1]).to have_content(3)
      expect(page.all('li')[2]).to have_content(2)
    end
  end
end
