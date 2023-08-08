require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'associations' do
    it { should have_many :favorites }
  end

  describe 'validations' do
    it { should validate_presence_of :name }
    it { should validate_presence_of :password }
    it { should validate_uniqueness_of :email }
  end

  describe 'model' do
    it 'exists and has attributes' do
      data = {
        "name": "email",
        "email": "email4@email.com",
        "password": "email",
        "password_confirmation": "email",
        "api_key": "jgn983hy48thw9begh98h4539h4"
      }
      user = User.create!(data)
      expect(user).to be_a User
      expect(user.id).to be_a Integer
      expect(user.name).to eq data[:name]
      expect(user.email).to eq data[:email]
      expect(user.password_digest).to be_a String
      expect(user.api_key).to be_a String
    end
  end
end