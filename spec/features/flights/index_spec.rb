require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the flights index page' do
    before :each do
      @pas_1 = Passenger.create!(name: "Pas 1", age: 5)
      @pas_2 = Passenger.create!(name: "Pas 2", age: 10)
      @pas_3 = Passenger.create!(name: "Pas 3", age: 15)

      @flight_1 = Flight.create!(number: 36012)
      @flight_2 = Flight.create!(number: 50239)
      @flight_3 = Flight.create!(number: 12353)

      PassengerFlight.create!(passenger: @pas_1, flight: @flight_1)
      PassengerFlight.create!(passenger: @pas_1, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_2, flight: @flight_3)
      PassengerFlight.create!(passenger: @pas_3, flight: @flight_2)
      PassengerFlight.create!(passenger: @pas_3, flight: @flight_3)

      visit '/flights'
    end
    it 'I see a list of all flight numbers' do
      expect(page).to have_content(@flight_1.number)
      expect(page).to have_content(@flight_2.number)
      expect(page).to have_content(@flight_3.number)
    end

    it 'under each flight number I see the names of all that flights passengers' do
      within ".flight-#{@flight_1.number}-passengers" do
        expect(page).to have_content(@pas_1.name)
      end

      within ".flight-#{@flight_2.number}-passengers" do
        expect(page).to have_content(@pas_1.name)
        expect(page).to have_content(@pas_3.name)
      end

      within ".flight-#{@flight_3.number}-passengers" do
        expect(page).to have_content(@pas_2.name)
        expect(page).to have_content(@pas_3.name)
      end
    end
  end
end
