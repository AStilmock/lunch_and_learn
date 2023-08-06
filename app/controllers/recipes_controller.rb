class RecipesController
  def index

    render json: RecipeSerializer.new(RecipeSearch.new(params[:country]))
  end
end