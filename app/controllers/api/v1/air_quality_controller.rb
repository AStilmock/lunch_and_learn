class Api::V1::AirQualityController < ApplicationController
  def index
    air = AirQualitySearch.new.city_air_quality(params[:city])
    # require 'pry'; binding.pry
    render json: AirQualitySerializer.new(air)
  end
end