require 'rails_helper'

RSpec.describe Recipe do
  describe 'recipe objects' do
    it 'exists and has attributes' do
      data = { 
        recipe: {
          label: 'escargot',
          url: 'otherurl.url',
          image: 'url.url'
        }
      }
      country = "france"

      recipe = Recipe.new(data, country)
      expect(recipe).to be_a Recipe
      expect(recipe.id).to eq "null"
      expect(recipe.type).to eq "recipe"
      expect(recipe.title).to eq "escargot"
      expect(recipe.url).to eq "otherurl.url"
      expect(recipe.country).to eq "france"
      expect(recipe.image).to eq "url.url" 
    end
  end
end