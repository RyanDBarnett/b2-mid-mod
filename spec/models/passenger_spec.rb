require 'rails_helper'

describe Passenger do
  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :age }
  end

  describe "relationships" do
    it { should have_many :passenger_flights }
    it { should have_many(:flights).through(:passenger_flights) }
  end

  describe 'instance methods' do
    it 'total_flights' do
      @airline = Airline.create!(name: 'Frontier')

      @pas_1 = Passenger.create!(name: "Pas 1", age: 5)

      @flight_1 = Flight.create!(number: 36012, airline: @airline)
      @flight_2 = Flight.create!(number: 50239, airline: @airline)

      PassengerFlight.create!(passenger: @pas_1, flight: @flight_1)
      PassengerFlight.create!(passenger: @pas_1, flight: @flight_2)

      expect(@pas_1.total_flights).to eq(2)
    end
  end
end
