require 'rails_helper'

describe Flight do
  describe "validations" do
    it { should validate_presence_of :number }
  end

  describe "relationships" do
    it { should belong_to :airline }
    it { should have_many :passenger_flights }
    it { should have_many(:passengers).through(:passenger_flights) }
  end

  describe 'instance methods' do
    it 'find_passenger_flight' do
      @airline = Airline.create!(name: 'Frontier')

      @pas_1 = Passenger.create!(name: "Pas 1", age: 5)

      @flight_1 = Flight.create!(number: 36012, airline: @airline)

      @pas_flight_1 = PassengerFlight.create!(passenger: @pas_1, flight: @flight_1)

      expect(@flight_1.find_passenger_flight_id(@pas_1.id)).to eq(@pas_flight_1.id)
    end
  end
end
