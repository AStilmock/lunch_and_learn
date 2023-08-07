require 'rails_helper'

RSpec.describe AirQualityService do
  describe 'air quality service' do
    it 'returns data' do
      data = File.read('spec/fixtures/air_quality/paris_air.json')
      stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Paris")
      .to_return(status: 200, body: data)
      air = AirQualityService.new.city_air_quality("Paris")
      expect(air).to be_a Hash
      expect(air).to have_key :CO
      expect(air).to have_key :NO2
      expect(air).to have_key :O3
      expect(air).to have_key :SO2
      expect(air).to have_key :"PM2.5"
      expect(air).to have_key :PM10
      expect(air).to have_key :overall_aqi
    end

    it 'returns values from keys' do
      data = File.read('spec/fixtures/air_quality/paris_air.json')
      stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Paris")
      .to_return(status: 200, body: data)
      air = AirQualityService.new.city_air_quality("Paris")
      expect(air[:CO][:concentration]).to eq 216.96
      expect(air[:NO2][:concentration]).to eq 2.66
      expect(air[:O3][:concentration]).to eq 75.82
      expect(air[:SO2][:concentration]).to eq 2.44
      expect(air[:"PM2.5"][:concentration]).to eq 2.95
      expect(air[:PM10][:concentration]).to eq 3.82
      expect(air[:overall_aqi]).to eq 102
    end
  end
end