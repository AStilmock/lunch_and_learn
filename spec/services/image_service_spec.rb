require 'rails_helper'

RSpec.describe "Image Service" do
  describe 'images request response path' do
    it 'gets image data from service' do
      data = File.read('spec/fixtures/images/images.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=computer")
      .to_return(status: 200, body: data)
      image = ImageService.new.get_images("computer")

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
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=france")
      .to_return(status: 200, body: data)
      image = ImageService.new.get_images("france")
      expect(image[:results].first[:alt_description]).to eq "group of people walking near body of water and building under blue sky at daytime"
      expect(image[:results].first[:urls]).to be_a Hash
      expect(image[:results].first[:urls][:raw]).to eq "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixid=M3w0ODU5ODR8MHwxfHNlYXJjaHwxfHxmcmFuY2V8ZW58MHx8fHwxNjkxNDU1ODM3fDA&ixlib=rb-4.0.3"
    end
  end
end