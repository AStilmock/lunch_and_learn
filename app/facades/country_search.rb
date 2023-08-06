class CountrySearch
  def service
    CountryService.new
  end

  def get_country
    request = service.get_country
    @country = Country.new(request.first[:name][:common])
  end
end