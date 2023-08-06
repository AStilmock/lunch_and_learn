class RecipeService
  def conn
    Faraday.new(url: 'https://api.edamam.com/api') do |f|
      f.params['app_id'] = ENV['recID']
      f.params['app_key'] = ENV['recikey']
    end
  end

  def get_url(url)
    response = conn.get(url)
    JSON.parse(response.body, symbolize_names: true)
  end

  def recipes_by_country(country)
    get_url("?type=public&q=#{country}")
  end
end

