class CountryService
  def conn
    Faraday.new(url: "https://restcountries.com")
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def get_country   
    get_url("/v3.1/all")
  end

  def get_one_country(country)
    get_url("https://restcountries.com/v3.1/name/#{country}?fullText=true")
  end
end