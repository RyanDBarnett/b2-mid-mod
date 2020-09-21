class Airline < ApplicationRecord
  validates_presence_of :name

  has_many :flights
  has_many :passengers, through: :flights
end
