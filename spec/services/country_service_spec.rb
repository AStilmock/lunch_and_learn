require 'rails_helper'

RSpec.describe CountryService do
  describe 'countries api request response' do
    it 'returns a response' do
      json_response = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/v3.1/all").
        to_return(status: 200, body: json_response)
      country_data = CountryService.new.get_country
      @country = country_data[:name][:common]

      expect(@country).to be_a String
      expect(@country).to eq "France"
    end
  end
end