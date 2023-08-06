require 'rails_helper'

RSpec.describe CountryService do
  describe 'countries api request response' do
    it 'returns a response' do
      json_response = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/name/france?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&fullText=true").
        to_return(status: 200, body: json_response)
      country_data = CountryService.new.get_country("france").first
      @country = country_data[:name][:common]

      expect(@country).to be_a String
      expect(@country).to eq "France"
    end
  end
end