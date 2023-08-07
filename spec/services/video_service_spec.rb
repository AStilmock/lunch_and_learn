require 'rails_helper'

RSpec.describe VideoService do
  describe 'Video Search Facade' do
    it 'returns video data' do
      video_data = File.read('spec/fixtures/videos/videos.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=AIzaSyDq_VGPfmXDQ27-7xqyUD0f_yUee4AMoZA&part=snippet")
      .to_return(status: 200, body: video_data)
      data = VideoService.new.get_videos
      video = data[:items].first
      expect(video).to be_a Hash
      expect(video).to have_key :snippet
      expect(video).to have_key :id
      expect(video[:snippet]).to be_a Hash
      expect(video[:snippet]).to have_key :title
      expect(video[:id]).to be_a Hash
      expect(video[:id]).to have_key :videoId
    end
    
    it 'gets values from keys' do
      video_data = File.read('spec/fixtures/videos/videos.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=AIzaSyDq_VGPfmXDQ27-7xqyUD0f_yUee4AMoZA&part=snippet")
      .to_return(status: 200, body: video_data)
      data = VideoService.new.get_videos
      video = data[:items].first
      expect(video[:snippet][:title]).to eq "A Super Quick History of Grenada"
      expect(video[:id][:videoId]).to eq "1FzkQQkAm-U"
    end
  end
end