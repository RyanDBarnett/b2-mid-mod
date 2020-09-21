require 'rails_helper'

describe 'As a visitor' do
  describe 'When I visit the flights index page' do
    it 'I see a list of all flight numbers' do
      visit '/flights'


    end
  end
end
