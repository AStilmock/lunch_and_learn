class CountryService
  def conn
    Faraday.new(url: 'https://restcountries.com/v3.1') do |f|
      f.params['app_id'] = ENV['recID']
      f.params['app_key'] = ENV['recikey']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_country(country)
    get_url("/name/#{country}?fullText=true")
  end
end