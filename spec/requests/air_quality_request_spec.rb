require 'rails_helper'

RSpec.describe "AirQualities", type: :request do
  describe 'air quality api request response path' do
    it 'returns air quality data' do
      air_quality = File.read('spec/fixtures/air_quality/paris_air.json')
      stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Paris")
      .to_return(status: 200, body: air_quality)

      city = CountryPoro.new("Paris")
      allow_any_instance_of(CountrySearch).to receive(:capital_city).and_return("Paris")
      get '/api/v1/air_quality?country=France', params: {city: 'Paris'}, headers: { 'Accept' => 'application/json' }
      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data).to be_a Hash
      expect(data).to have_key :id
      expect(data).to have_key :type
      expect(data).to have_key :attributes
      expect(data[:attributes]).to have_key :city
      expect(data[:attributes]).to have_key :aqi
      expect(data[:attributes]).to have_key :pm25_concentration
      expect(data[:attributes]).to have_key :co_concentration
    end

    it 'returns values from keys' do
      air_quality = File.read('spec/fixtures/air_quality/paris_air.json')
      stub_request(:get, "https://api.api-ninjas.com/v1/airquality?city=Paris")
      .to_return(status: 200, body: air_quality)

      city = CountryPoro.new("Paris")
      allow_any_instance_of(CountrySearch).to receive(:capital_city).and_return("Paris")
      get '/api/v1/air_quality?country=France', params: {city: 'Paris'}, headers: { 'Accept' => 'application/json' }
      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to eq "null"
      expect(data[:type]).to eq "air_quality"
      expect(data[:attributes][:city]).to eq "Paris"
      expect(data[:attributes][:aqi]).to eq 102
      expect(data[:attributes][:pm25_concentration]).to eq 2.95
      expect(data[:attributes][:co_concentration]).to eq 216.96
    end
  end
end