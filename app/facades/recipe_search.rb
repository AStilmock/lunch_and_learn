class RecipeSearch
  def service
    service = RecipeService.new
  end

  def recipes_by_country(country)
    request = service.recipes_by_country(country)
    @recipes = request[:hits].map do |data|
      Recipe.new(data, country)
    end
  end
end