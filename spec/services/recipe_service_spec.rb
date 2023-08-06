require 'rails_helper'

RSpec.describe RecipeService do
  describe 'recipe api request response' do
    it 'successful response' do
      # @recipes = RecipeSearch.new.recipes_by_country("france")
      # expect(resopnse).to eq 200
      # expect(@recipes).to be_an(Array)
    end

    it 'returns a response' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france").
        to_return(status: 200, body: json_response)
      response = Faraday.get("https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france")
      data = JSON.parse(response.body, symbolize_names: true)[:hits]
      
      expect(data).to be_an(Array)
      expect(data.count).to eq(20)
      data.each do |d|
        expect(d).to be_a(Hash)
        expect(d).to have_key(:recipe)
        expect(d[:recipe]).to be_a(Hash)
        expect(d[:recipe][:label]).to be_a(String)
        expect(d[:recipe][:image]).to be_a(String)
        expect(d[:recipe][:url]).to be_a(String)
        expect(d[:recipe]).to_not have_key(:id)
        expect(d[:recipe]).to_not have_key(:type)
      end
    end
  end
end