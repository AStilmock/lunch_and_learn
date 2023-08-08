require 'rails_helper'

RSpec.describe 'Save favorite recipes' do
  describe 'save favorite recies request response path' do
    it 'can save a favorite recipe' do
      user = User.create!(name: "email", email: "email@email.com", password: "password", api_key: "apikey1234567890")
      data = {
        "api_key": "jgn983hy48thw9begh98h4539h4",
        "country": "france",
        "recipe_link": "http://www.edamam.com/ontologies/edamam.owl#recipe_48df011ddfee5cd4dacff1463e8701b0",
        "recipe_title": "Herb And White Wine Granita"
      }
      # recipe = File.read('spec/fixtures/recipes/france_recipes.json')
      # stub_request(:get, "https://api.edamam.com/api/recipes/v2?app_id=#{ENV['recID']}&app_key=#{ENV['recikey']}&q=france&type=public")
      # .to_return(status: 200, body: recipe)
      # recipes = RecipeService.new.recipes_by_country("france")[:hits].first
      # recipe = recipes[:recipe]
      # recipe_link = recipe[:uri]
      # recipe_title = recipe[:label]
      post '/api/v1/favorites', params: data, headers: { 'Accept': 'application/json' }
      require 'pry'; binding.pry
    end
  end
end