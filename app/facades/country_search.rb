class CountrySearch
  def service
    CountryService.new
  end

  def get_country
    request = service.get_country
    Country.new(request[:name][:common])
  end

  def capital_city(country)
    request = service.get_one_country(country)
    CountryPoro.new(request[:capital].first)
  end
end