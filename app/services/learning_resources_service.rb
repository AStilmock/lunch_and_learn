class LearningResourcesService
  def conn
    Faraday.new(url: 'https://www.googleapis.com') do |f|
    f.params['API Key'] = ENV['YT_HISTORKEY']
  end

  def get_url(url)
    reponse = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_videos
    # get_url('/youtube/v3/videos')
  end
end