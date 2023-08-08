require 'rails_helper'

RSpec.describe 'Register New User' do
  describe 'register user request response path' do
    it 'can register user in database' do
      data = {
        "name": "email",
        "email": "email8@email.com",
        "password": "email",
        "password_confirmation": "email",
        "api_key": "1234567890"
      }
      User.create!(data)
      user = User.last
      expect(user).to be_a User
      expect(user.id).to be_a Integer
      expect(user.name).to eq("email")
      expect(user.email).to eq("email8@email.com")
      expect(user.password_digest).to be_a String
      expect(user.api_key).to be_a String
    end
    it 'can register a new user from post request' do
      data = {
        "name": "email",
        "email": "email10@email.com",
        "password": "email",
        "password_confirmation": "email"
      }
      headers = { 'Accept' => 'application/json'}
      post '/api/v1/users', params: data, headers: { 'Accept' => 'application/json'}
      user_info = JSON.parse(response.body, symbolize_names: true)
      expect(response).to be_successful
      expect(response.status).to eq(201)
      expect(user_info).to have_key :data
      expect(user_info[:data]).to be_a Hash
      expect(user_info[:data]).to have_key :id
      expect(user_info[:data]).to have_key :type
      expect(user_info[:data]).to have_key :attributes
      expect(user_info[:data][:attributes]).to have_key :name
      expect(user_info[:data][:attributes]).to have_key :email
      expect(user_info[:data][:attributes]).to have_key :api_key
    end

    it 'gets values from keys' do
      data = {
        "name": "email",
        "email": "email11@email.com",
        "password": "email",
        "password_confirmation": "email"
      }
      headers = { 'Accept' => 'application/json'}
      post '/api/v1/users', params: data, headers: { 'Accept' => 'application/json'}
      user_info = JSON.parse(response.body, symbolize_names: true)
      expect(user_info[:data][:id]).to be_a String
      expect(user_info[:data][:type]).to eq "user"
      expect(user_info[:data][:attributes][:name]).to eq "email"
      expect(user_info[:data][:attributes][:email]).to eq "email11@email.com"
      expect(user_info[:data][:attributes][:api_key]).to be_a String
    end
  end
end