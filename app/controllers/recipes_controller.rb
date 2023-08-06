class RecipesController < ApplicationController
  def index
    recipes = RecipeSearch.new.recipes_by_country(params[:country])
    require 'pry'; binding.pry
    render json: RecipeSerializer.new(recipes)
  end
end