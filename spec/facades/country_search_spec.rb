require 'rails_helper'

RSpec.describe CountrySearch do
  describe 'country search facade' do
    it 'returns a country' do
      recipes = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/v3.1/all")
      .to_return(status: 200, body: recipes)
      @country = CountrySearch.new.get_country
      expect(@country).to be_a Country
      expect(@country.name).to eq "France"
    end

    it 'returns a capital city' do
      country = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/v3.1/name/france?fullText=true")
      .to_return(status: 200, body: country)
      city = CountrySearch.new.capital_city("france")
      expect(city).to be_a CountryPoro
      expect(city.city).to eq "Paris"
    end
  end
end