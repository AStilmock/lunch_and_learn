class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if user
      render json: FavoriteSerializer.new(user.favorites)
    else
      render json: { "error": "Invalid request please try again" }, status: 401
    end
  end

  def create
    user = User.find_by(api_key: params[:api_key])
    if user
      user.favorites.create!(fav_params)
      render json: { "success": "Favorite added successfully" }
    else
      render json: { "error": "Invalid request please try again" }, status: 401
    end
  end

  private
  def fav_params
    params.permit(:country, :recipe_link, :recipe_title)
  end
end