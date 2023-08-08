require 'rails_helper'

RSpec.describe 'Register New User' do
  describe 'register user request response path' do
    it 'can register a new user' do
      data = {
        "name": "email",
        "email": "email@email.com",
        "password": "email",
        "password_confirmation": "email"
      }
      
      # headers = { 'Accept' => 'application/json'}
      # params: JSON.generate(data)
      # post 'api/v1/users', headers: { 'Accept' => 'application/json'}, params: JSON.generate(data)
      user = User.create!(data)
      # require 'pry'; binding.pry
    end
  end
end