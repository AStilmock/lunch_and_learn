require 'rails_helper'

RSpec.describe 'Video Search Facade' do
  describe 'Video Search' do
    it 'returns video data' do
      video_data = File.read('spec/fixtures/videos/videos.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=AIzaSyDq_VGPfmXDQ27-7xqyUD0f_yUee4AMoZA&part=snippet")
      .to_return(status: 200, body: video_data)
      data = VideoSearch.new.videos
      expect(data).to be_a Video
      expect(data.title).to eq "A Super Quick History of Grenada"
      expect(data.video_id).to eq "1FzkQQkAm-U"
    end
  end
end