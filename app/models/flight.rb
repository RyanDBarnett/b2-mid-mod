class Flight < ApplicationRecord
  validates_presence_of :number

  has_many :passenger_flights
  has_many :passengers, through: :passenger_flights
end
