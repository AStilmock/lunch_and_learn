class RecipeService
  def conn
    Faraday.new(url: '') do |f|
      f.params['app_id'] = ENV['recID']
      f.params['app_key'] = ENV['recikey']
    end
  end

  def get_url(url)
    response = conn.get(url)
    require 'pry'; binding.pry
    JSON.parse(response.body, symbolize_names: true)
  end

  def recipes_by_country(country)
    get_url("https://api.edamam.com/api/recipes/v2?type=public&app_id=aefdc154&app_key=e1630b1eb84bc7c2a45d0ad75126bc2e&q=#{country}")
  end
end

