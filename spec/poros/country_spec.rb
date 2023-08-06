require 'rails_helper'

RSpec.describe Country do
  describe 'Country object' do
    it 'exists and has attributes' do
        @country = Country.new("France")
        expect(@country).to be_a Country
        expect(@country.name).to eq "France"
    end
  end
end