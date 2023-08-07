require 'rails_helper'

RSpec.describe 'Country PORO' do
  describe 'Country' do
    it 'exists and has attributes' do
      city = CountryPoro.new("Paris")
      expect(city).to be_a CountryPoro
      expect(city.city).to eq "Paris"
    end
  end
end