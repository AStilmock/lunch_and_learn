require 'rails_helper'

RSpec.describe 'Video PORO' do
  describe 'Video' do
    it 'exists and has attributes' do
      data = {
        :snippet => {
          :title => "video title"
        },
        :id => {
          :videoId => "Video ID"
        } 
      } 
      video_data = Video.new(data)
      expect(video_data).to be_a Video
      expect(video_data.title).to eq "video title"
      expect(video_data.video_id).to eq "Video ID"
    end
  end
end