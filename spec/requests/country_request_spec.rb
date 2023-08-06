require 'rails_helper'

RSpec.describe 'Countries API' do
  describe 'api request response path' do
    it 'successful request' do
      json_response = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/v3.1/name/France?fullText=true")
      .to_return(status: 200, body: json_response)
      get '/api/v1/countries', params: {name: 'france'}, headers: { 'Accept' => 'application/json' }

      expect(response).to be_successful
      expect(response.status).to eq(204)
    end
  end

  it 'gets a country name'  do
    json_response = File.read('spec/fixtures/countries/france_search.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/France?fullText=true")
    .to_return(status: 200, body: json_response)
    get '/api/v1/countries', params: {name: 'france'}, headers: { 'Accept' => 'application/json' }
    require 'pry'; binding.pry
  end
end