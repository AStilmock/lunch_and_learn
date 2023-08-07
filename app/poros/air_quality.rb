class AirQuality
  attr_reader
  def initialize(data, city)
    @id = "null"
    @type = "air_quality"
    @city = city
    @aqi = data[:overall_aqi]
    @pm25_concentration = data[:PM2.5][:concentration]
    @co_concentration = data[:CO][:concentration]
  end
end