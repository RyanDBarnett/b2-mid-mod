class Passenger < ApplicationRecord
  validates_presence_of :name,
                        :age

  has_many :passenger_flights
  has_many :flights, through: :passenger_flights

  def total_flights
    flights.count
  end
end
