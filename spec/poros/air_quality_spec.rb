require 'rails_helper'

RSpec.describe 'Air Quality PORO' do
  describe 'AirQuatlity' do
    it 'exists and has attributes' do
      data = {
        :overall_aqi => 102,
        :"PM2.5" => {
          :concentration => 2.95
        },
        :CO => {
          :concentration => 216.96
        }
      }
      air = AirQuality.new(data, "Paris")
      expect(air).to be_a AirQuality
      expect(air.city).to eq"Paris"
      expect(air.aqi).to eq 102
      expect(air.co_concentration).to eq 216.96
      expect(air.id).to eq "null"
      expect(air.pm25_concentration).to eq 2.95
      expect(air.type).to eq "air_quality"
    end
  end
end