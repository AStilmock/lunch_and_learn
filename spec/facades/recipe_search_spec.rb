require 'rails_helper'

RSpec.describe RecipeSearch do
  describe 'recipe search facade' do
    it 'returns recipes by country' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france").
        to_return(status: 200, body: json_response)
      response = Faraday.get("https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france")
      data = JSON.parse(response.body, symbolize_names: true)[:hits]
      @recipes = data.map do |r|
        Recipe.new(r, "france")
      end

      expect(@recipes).to be_an(Array)
      expect(@recipes.count).to eq(20)
      @recipes.each do |r|
        expect(r).to be_a Recipe 
        expect(r.id).to eq nil
        expect(r.type).to be_a(String)
        expect(r.title).to be_a(String)
        expect(r.url).to be_a(String)
        expect(r.country).to eq "france"
        expect(r.image).to be_a(String)
      end
    end
  end
end