require 'rails_helper'

RSpec.describe "Image Service" do
  describe 'images request response path' do
    it 'gets image data from service' do
      data = File.read('spec/fixtures/images/images.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=computer")
      .to_return(status: 200, body: data)
      image = ImageService.new.get_photos("computer")

      expect(image).to be_a Hash
      expect(image).to have_key :results
      expect(image[:results]).to be_an Array
      expect(image[:results].first).to be_an Hash
      expect(image[:results].first).to be_an Hash
      expect(image[:results].first).to have_key :alt_description
      expect(image[:results].first).to have_key :urls
    end

    it 'gets values from keys' do
      data = File.read('spec/fixtures/images/images.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=computer")
      .to_return(status: 200, body: data)
      image = ImageService.new.get_photos("computer")
      expect(image[:results].first[:alt_description]).to eq "MacBook Pro on top of brown table"
      expect(image[:results].first[:urls]).to be_a Hash
      expect(image[:results].first[:urls][:raw]).to eq "https://images.unsplash.com/photo-1496181133206-80ce9b88a853?ixid=M3w0ODU5ODR8MHwxfHNlYXJjaHwxfHxjb21wdXRlcnxlbnwwfHx8fDE2OTE0NDk3MjN8MA&ixlib=rb-4.0.3"
    end
  end
end