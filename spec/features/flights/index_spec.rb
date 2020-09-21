require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the flights index page' do
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

    describe 'Next to each passengers name' do
      it 'I see a link to remove that passenger from that flight' do
        within ".flight-#{@flight_1.number}-passengers" do
          expect(page).to have_link('Cancel Flight')
        end
      end

      describe 'When I click on that link' do
        it "I'm returned to the flights index page" do
          within ".flight-#{@flight_1.number}-passengers" do
            page.all('a')[0].click

            expect(current_path).to eq('/flights')
          end
        end

        it 'I no longer see that passenger listed under that flight' do
          within ".flight-#{@flight_1.number}-passengers" do
            page.all('a')[0].click

            expect(page).to_not have_content(@pas_1.name)
          end
        end
      end
    end
  end
end
