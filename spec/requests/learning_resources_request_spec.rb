require 'rails_helper'

RSpec.describe 'LearningResources' do
  describe 'learning resources request response path' do
    it 'gets json response for learning resources' do
      video_data = File.read('spec/fixtures/videos/videos.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['YT_HISTORKEY']}&part=snippet")
      .to_return(status: 200, body: video_data)
      image = File.read('spec/fixtures/images/images.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=france")
      .to_return(status: 200, body: image)
      get '/api/v1/learning_resources?country=france', headers: { 'Accept' => 'application/json' } #/api/v1/learning_resources?country=france
      data = JSON.parse(response.body, symbolize_names: true)[:data]
      expect(data).to be_a Hash
      expect(data).to have_key :id
      expect(data).to have_key :type
      expect(data).to have_key :attributes
      expect(data[:attributes]).to have_key :country
      expect(data[:attributes]).to have_key :video
      expect(data[:attributes]).to have_key :images
      expect(data[:attributes][:video]).to have_key :title
      expect(data[:attributes][:video]).to have_key :youtube_video_id
      expect(data[:attributes][:images]).to be_a Array
      expect(data[:attributes][:images].first).to have_key :alt_tag
      expect(data[:attributes][:images].first).to have_key :url
    end

    it 'gets values from keys' do
      video_data = File.read('spec/fixtures/videos/videos.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['YT_HISTORKEY']}&part=snippet")
      .to_return(status: 200, body: video_data)
      image = File.read('spec/fixtures/images/images.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=france")
      .to_return(status: 200, body: image)
      get '/api/v1/learning_resources?country=france', headers: { 'Accept' => 'application/json' } 
      data = JSON.parse(response.body, symbolize_names: true)[:data]

      expect(data[:id]).to eq "null"
      expect(data[:type]).to eq "learning_resources"
      expect(data[:attributes][:country]).to eq "france"
      expect(data[:attributes][:video][:title]).to eq "A Super Quick History of Grenada"
      expect(data[:attributes][:video][:youtube_video_id]).to eq "1FzkQQkAm-U"
      expect(data[:attributes][:images].first[:alt_tag]).to eq "group of people walking near body of water and building under blue sky at daytime"
      expect(data[:attributes][:images].first[:url]).to eq "https://images.unsplash.com/photo-1503917988258-f87a78e3c995?ixid=M3w0ODU5ODR8MHwxfHNlYXJjaHwxfHxmcmFuY2V8ZW58MHx8fHwxNjkxNDU1ODM3fDA&ixlib=rb-4.0.3"
    end

    it 'returns empty hash if no videos exist' do
      video_data = File.read('spec/fixtures/countries/empty_country.json')
      stub_request(:get, "https://youtube.googleapis.com/youtube/v3/search?channelId=UCluQ5yInbeAkkeCndNnUhpw&key=#{ENV['YT_HISTORKEY']}&part=snippet")
      .to_return(status: 200, body: video_data)
      image = File.read('spec/fixtures/countries/empty_country.json')
      stub_request(:get, "https://api.unsplash.com/search/photos?client_id=#{ENV['UNSPLASHKEY']}&query=%22%22")
      .to_return(status: 200, body: image)
      get '/api/v1/learning_resources?country=""', headers: { 'Accept' => 'application/json' }
      data = JSON.parse(response.body, symbolize_names: true)[:data]
      # require 'pry'; binding.pry
      expect(response).to be_successful
      expect(response.status).to eq 200
      expect(data).to be_a Hash
      expect(data[:id]).to eq "null"
      expect(data[:type]).to eq "learning_resources"
      expect(data[:attributes][:country]).to eq "\"\""
      expect(data[:attributes][:video]).to be_a Hash
      expect(data[:attributes][:images]).to eq []
    end
  end
end