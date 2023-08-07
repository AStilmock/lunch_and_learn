class VideoService
  def conn
    Faraday.new(url: 'https://youtube.googleapis.com/youtube/v3/search') do |f|
    f.params['key'] = ENV['YT_HISTORKEY']
  end

  def get_url(url)
    reponse = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_videos
    get_url('?part=snippet&channelId=UCluQ5yInbeAkkeCndNnUhpw')
  end
end