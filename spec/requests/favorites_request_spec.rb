require 'rails_helper'

RSpec.describe 'Save favorite recipes' do
  describe 'save favorite recies request response path' do
    it 'can save a favorite recipe' do
      user = User.create!(name: "email2", email: "email2@email.com", password: "password", api_key: "apikey1234567890")
      data = {
        "api_key": "apikey1234567890",
        "country": "france",
        "recipe_link": "http://www.edamam.com/ontologies/edamam.owl#recipe_48df011ddfee5cd4dacff1463e8701b0",
        "recipe_title": "Herb And White Wine Granita"
      }
      post '/api/v1/favorites', params: data, headers: { 'Accept': 'application/json' }
      response_info = JSON.parse(response.body, symbolize_names: true)
      # require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response_info[:success]).to eq "Favorite added successfully"
    end
  end
end