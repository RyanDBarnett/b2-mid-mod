require 'rails_helper'

describe Flight do
  describe "validations" do
    it { should validate_presence_of :number }
  end

  describe "relationships" do
    it { should have_many :passenger_flights }
    it { should have_many(:passengers).through(:passenger_flights) }
  end
end
