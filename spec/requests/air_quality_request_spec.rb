require 'rails_helper'

RSpec.describe "AirQualities", type: :request do
  describe 'air quality api request response path' do
    it 'has successful response' do
      data = File.read('spec/fixtures/air_quality/paris_air.json')
    end
  end
end