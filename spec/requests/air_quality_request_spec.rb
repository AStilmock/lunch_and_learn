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
      require 'pry'; binding.pry
      data = JSON.parse(response.body, symbolize_names: true)
    end
  end
end