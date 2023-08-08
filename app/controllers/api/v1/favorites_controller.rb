class Api::V1::FavoritesController < ApplicationController
  def create
    user = User.find_by(api_key: params[:api_key])
    if !user.nil?
      user.favorites.create!(fav_params)
      render json: { "success": "Favorite added successfully" }
    end
  end

  private
  def fav_params
    params.permit(:country, :recipe_link, :recipe_title, :api_key)
  end
end