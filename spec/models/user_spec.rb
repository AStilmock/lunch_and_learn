require 'rails_helper'

RSpec.describe 'Register New User' do
  describe 'register user request response path' do
    it 'can register a new user' do
      data = {
        "name": "email",
        "email": "email@email.com",
        "password": "email",
        "password_confirmation": "email",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
      user = User.create!(data)
      expect(user).to be_a(User)
      expect(user.id).to be_a Integer
      expect(user.name).to eq data[:name]
      expect(user.email).to eq data[:email]
      expect(user.password_digest).to be_a String
      expect(user.api_key).to be_a String
    end
  end
end