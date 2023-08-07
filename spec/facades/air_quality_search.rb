require 'rails_helper'

RSpec.describe AirQualitySearch do
  describe 'air quality search facade' do
    it 'returns air quality' do
      air = File.read('spec/fixtures/air_quality/paris_air.json')
      stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Paris")
      .to_return(status: 200, body: air)
      data = AirQualitySearch.new.city_air_quality("Paris")

      expect(data).to be_a AirQuality
      expect(data.aqi).to eq 102
      expect(data.city).to eq "Paris"
      expect(data.co_concentration).to eq 216.96
      expect(data.id).to eq "null"
      expect(data.pm25_concentration).to eq 2.95
      expect(data.type).to eq "air_quality"
    end
  end
end