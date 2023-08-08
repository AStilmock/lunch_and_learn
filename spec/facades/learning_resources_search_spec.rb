require 'rails_helper'

RSpec.describe 'Learning Resources Facade' do
  describe 'learning resources search' do
    it 'uses video and image services' do
      video_data = File.read('spec/fixtures/videos/videos.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['YT_HISTORKEY']}&part=snippet")
      .to_return(status: 200, body: video_data)

      image = File.read('spec/fixtures/images/images.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=france")
      .to_return(status: 200, body: image)
      
      resource = LearningResourcesSearch.new.learning_resources("france")
      expect(resource).to be_a LearningResource
      expect(resource.country).to eq "france"
      expect(resource.id).to eq "null"
      expect(resource.images).to be_a Array
      expect(resource.images.first).to be_a Hash
      expect(resource.images.first["alt_tag"]).to eq "group of people walking near body of water and building under blue sky at daytime"
      expect(resource.images.first["url"]).to eq "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixid=M3w0ODU5ODR8MHwxfHNlYXJjaHwxfHxmcmFuY2V8ZW58MHx8fHwxNjkxNDU1ODM3fDA&ixlib=rb-4.0.3"
    end
  end
end