require 'rails_helper'

RSpec.describe RecipeService do
  describe 'recipe api request response' do
    it 'successful response' do
      
    end

    it 'returns a response' do
      json_response = File.read('spec/fixtures/recipes/france_recipes.json')
      stub_request(:get, "https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france").
        to_return(status: 200, body: json_response)
      response = Faraday.get("https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=france")
      data = JSON.parse(response.body, symbolize_names: true)
      @recipes = data[:hits].map do |data|
        Recipe.new(data, "france")
      end


      # get "api/v1/recipes?country=france"

      require 'pry'; binding.pry
    end
  end
end