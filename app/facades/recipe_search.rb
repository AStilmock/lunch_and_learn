class RecipeSearch
  def service
    RecipeService.new
  end

  def recipes_by_country(country)
    request = service.recipes_by_country(country)
    if request.class == Hash
      @recipes = request[:hits].map do |hit|
        Recipe.new(hit, country)
      end
    elsif request.class == String 
      info = JSON.parse(request, symbolize_names: true)
      info[:data]
    end
  end
end