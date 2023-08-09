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
      expect(response).to be_successful
      expect(response.status).to eq(200)
      expect(response_info[:success]).to eq "Favorite added successfully"
    end

    it 'can get user favorites' do
      user = User.create!(name: "email15", email: "email5@email.com", password: "password", api_key: "apikey1234567890")
      fav1 = user.favorites.create!(country: "france", recipe_link: "http://www.edamam.com/ontologies/edamam.owl#recipe_48df011ddfee5cd4dacff1463e8701b0", recipe_title: "Herb And White Wine Granita")
      fav2 = user.favorites.create!(country: "france", recipe_link: "http://www.edamam.com/ontologies/edamam.owl#recipe_0d543f253608386e21a3c9a62a4e43e7", recipe_title: "Savory Sesame Cookies")
      fav3 = user.favorites.create!(country: "france", recipe_link: "http://www.edamam.com/ontologies/edamam.owl#recipe_8f9e0a801e673792608e1a8b08b587d9", recipe_title: "France Meets Italy Panini")
      get '/api/v1/favorites?api_key=apikey1234567890'
      favorites = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(favorites).to be_a Array
      expect(favorites.count).to eq 3
      expect(favorites.first[:id]).to eq fav1.id.to_s
      expect(favorites.first[:type]).to eq "favorite"
      expect(favorites.second).to have_key :attributes
      expect(favorites.second[:attributes][:recipe_title]).to eq fav2.recipe_title
      expect(favorites.second[:attributes][:recipe_link]).to eq fav2.recipe_link
      expect(favorites.second[:attributes][:country]).to eq fav3.country
      expect(favorites.third[:attributes][:created_at]).to eq fav3.created_at.strftime("%Y-%m-%dT%H:%M:%S.%LZ")
    end
  end
end