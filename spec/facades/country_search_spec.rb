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
  end
end