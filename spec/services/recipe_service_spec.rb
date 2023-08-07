require 'rails_helper'

RSpec.describe RecipeService do
  describe 'recipe api request response' do
    it 'returns a response' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france&type=public").
        to_return(status: 200, body: json_response)
      @recipes = RecipeService.new.recipes_by_country("france")[:hits]
      
      expect(@recipes).to be_an(Array)
      expect(@recipes.count).to eq(20)
      @recipes.each do |r|
        expect(r).to be_a(Hash)
        expect(r).to have_key(:recipe)
        expect(r[:recipe]).to be_a(Hash)
        expect(r[:recipe][:label]).to be_a(String)
        expect(r[:recipe][:image]).to be_a(String)
        expect(r[:recipe][:url]).to be_a(String)
        expect(r[:recipe]).to_not have_key(:id)
        expect(r[:recipe]).to_not have_key(:type)
      end
    end
  end
end