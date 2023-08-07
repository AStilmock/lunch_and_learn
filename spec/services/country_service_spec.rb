require 'rails_helper'

RSpec.describe CountryService do
  describe 'countries api request response' do
    it 'returns a response' do
      json_response = File.read('spec/fixtures/countries/france_search.json')
      stub_request(:get, "https://restcountries.com/v3.1/all").
        to_return(status: 200, body: json_response)
      country = CountryService.new.get_country[:name][:common]
      
      expect(country).to be_a String
      expect(country).to eq "France"
    end
  end

  it "gets capital city" do
    json_response = File.read('spec/fixtures/countries/france_search.json')
    stub_request(:get, "https://restcountries.com/v3.1/name/france?fullText=true")
    .to_return(status: 200, body: json_response)
    city = CountryService.new.get_one_country("france")
    capital = city[:capital].first
    expect(city).to be_a Hash
    expect(capital).to be_a String
    expect(capital).to eq "Paris"
  end
end