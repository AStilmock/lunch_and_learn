class Api::V1::RecipesController < ApplicationController
  def index
    if params[:country].present?
      recipes = RecipeSearch.new.recipes_by_country(params[:country])
      render json: RecipeSerializer.new(recipes)
    else
      country = CountrySearch.new.get_country
      recipes = RecipeSearch.new.recipes_by_country(country)
      render json: RecipeSerializer.new(recipes)
    end
  end
end