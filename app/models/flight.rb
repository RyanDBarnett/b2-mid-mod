class Flight < ApplicationRecord
  validates_presence_of :number

  belongs_to :airline
  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights

  def find_passenger_flight_id passenger_id
    passenger_flights.find_by(passenger_id: passenger_id).id
  end
end
