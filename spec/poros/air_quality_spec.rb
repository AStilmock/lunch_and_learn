require 'rails_helper'

RSpec.describe 'Air Quality PORO' do
  describe 'AirQuatlity' do
    it 'exists and has attributes' do
      data = {
        :aqi => 102,
        :pm25_concentration => 2.95,
        :co_concentration => 216.96
      }
      air = AirQuality.new(data, "Paris")
      require 'pry'; binding.pry
      expect(air).to be_a AirQuality
      expect(air.city).to eq"Paris"
    end
  end
end