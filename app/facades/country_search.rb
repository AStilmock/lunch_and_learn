class CountrySearch
  def service
    CountryService.new
  end

  def get_country(country)
    request = service.get_country(country).first
    @country = Country.new(request[:name][:common])
  end
end