class RecipeSearch
  def service
    service = RecipeService.new
  end

  def recipes_by_country(country)
    request = service.recipes_by_country(country)
    require 'pry'; binding.pry
  end
end