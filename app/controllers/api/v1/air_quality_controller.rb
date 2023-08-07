class Api::V1::AirQualityController < ApplicationController
  def index
    if params[:city] != nil
      air = AirQualitySearch.new.city_air_quality(params[:city])
      render json: AirQualitySerializer.new(air)
    else
      city_name = CountrySearch.new.capital_city(params[:country])
      city = city_name.city
      air = AirQualitySearch.new.city_air_quality(city)
      render json: AirQualitySerializer.new(air)
    end
  end
end