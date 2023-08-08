require 'rails_helper'

RSpec.describe Favorite, type: :model do
  describe 'associations' do
    it { should belong_to :user }
  end

  describe 'validations' do
    it { should validate_presence_of :country }
    it { should validate_presence_of :recipe_link }
    it { should validate_presence_of :recipe_title }
  end

  describe 'model' do
    it 'exists and has attributes' do
      user = User.create!(name: "email3", email: "email3@email.com", password: "email", password_confirmation: "email", api_key: "jgn983hy48thw9begh98h4539h4")
      data = {
        "user_id": user.id,
        "country": "france",
        "recipe_link": "https://www.edamam.com/recipe/creamy-mushroom-pasta-9b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1b3c0a3b1",
        "recipe_title": "Creamy Mushroom Pasta"
      }
      fav = Favorite.create!(data)
      expect(fav).to be_a Favorite
      expect(fav.user_id).to eq user.id
      expect(fav.country).to eq data[:country]
      expect(fav.recipe_link).to eq data[:recipe_link]
      expect(fav.recipe_title).to eq data[:recipe_title]
    end
  end
end