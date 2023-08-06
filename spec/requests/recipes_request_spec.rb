require 'rails_helper'

RSpec.describe 'Recipes API' do
  describe 'api request response path' do
    it 'successful request' do
      get "api/v1/recipes?search=france"

      expect(request).to be_successful
      expect(request.status).to eq(200)
    end
  end
end