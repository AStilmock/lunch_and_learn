require 'rails_helper'

RSpec.describe "Sessions" do
  describe 'user login request response path' do
    it 'login user' do
      user = User.create!(name: "email", email: "email7@email.com", password: "password", api_key: "apikey1234567890")
      data = {
        "email": "email7@email.com",
        "password": "password"
      }
      headers = { 'Accept' => 'application/json'}
      post '/api/v1/sessions', params: data, headers: { 'Accept' => 'application/json'}
      user_info = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(user_info).to have_key :data
      expect(user_info[:data]).to be_a Hash
      expect(user_info[:data]).to have_key :id
      expect(user_info[:data]).to have_key :attributes
      expect(user_info[:data][:attributes]).to be_a Hash
      expect(user_info[:data][:attributes]).to have_key :name
      expect(user_info[:data][:attributes]).to have_key :email
      expect(user_info[:data][:attributes]).to have_key :api_key
    end

    it 'gets values from keys' do
      user = User.create!(name: "email", email: "email9@email.com", password: "password", api_key: "apikey1234567890")
      data = {
        "email": "email9@email.com",
        "password": "password"
      }
      headers = { 'Accept' => 'application/json'}
      post '/api/v1/sessions', params: data, headers: { 'Accept' => 'application/json'}
      user_info = JSON.parse(response.body, symbolize_names: true)
      expect(user_info[:data][:id]).to be_a String
      expect(user_info[:data][:type]).to eq "user"
      expect(user_info[:data][:attributes][:name]).to eq "email"
      expect(user_info[:data][:attributes][:email]).to eq "email9@email.com"
      expect(user_info[:data][:attributes][:api_key]).to be_a String
    end
  end
end