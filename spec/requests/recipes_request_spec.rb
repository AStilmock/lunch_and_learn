require 'rails_helper'

RSpec.describe 'Recipes API' do
  describe 'api request response path' do
    it 'successful request' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france&type=public")
      .to_return(status: 200, body: json_response)
      get '/api/v1/recipes/france'
      recipes = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(200)
    end

    it ''
  end
end