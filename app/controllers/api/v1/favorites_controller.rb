class Api::V1::FavoritesController < ApplicationController
  def index
    user = User.find_by(api_key: params[:api_key])
    if !user.nil?
      favorites = Favorite.user_favorites(user)
      render json: FavoriteSerializer.new(favorites)
    else
      render json: { "error": "Invalid request please try again" }, status: 401
    end
  end

  def create
  user = User.find_by(api_key: params[:api_key])
  if !user.nil?
    user.favorites.create!(fav_params)
    render json: { "success": "Favorite added successfully" }
  else
    render json: { "error": "Invalid request please try again" }, status: 401
  end

  private
  def fav_params
    params.permit(:country, :recipe_link, :recipe_title, :user_id)
  end
end