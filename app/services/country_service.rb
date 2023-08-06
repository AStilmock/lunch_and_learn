class CountryService
  def conn
    Faraday.new(url: 'https://restcountries.com/v3.1')
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_country(country)
    get_url("/name/#{country}?fullText=true")
  end
end