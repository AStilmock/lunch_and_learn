require 'rails_helper'

RSpec.describe CountrySearch do
  describe 'country search facade' do
    it 'returns a country' do
      json_response = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/name/france?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&fullText=true").
        to_return(status: 200, body: json_response)
      @country = CountrySearch.new.get_country("france")

      expect(@country).to be_a Country
      expect(@country.name).to eq "France"
    end
  end
end