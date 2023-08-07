class AirQualitySearch
  def service
    AirQualityService.new
  end

  def city_air_quality(city)
    request = service.city_air_quality(city)
    air_quality = AirQuality.new(request, city)
  end
end