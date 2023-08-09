class ImageService
  def conn
    Faraday.new(url: 'https://api.unsplash.com') do |f|
      f.params['client_id'] = ENV['UNSPLASHKEY']
    end
  end

  def get_url(url)
    response = conn.get(url)
    # require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_images(data)
    get_url("/search/photos?query=#{data}")
  end
end