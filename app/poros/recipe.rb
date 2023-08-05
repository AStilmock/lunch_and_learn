class Recipe
  attr_reader
  def initialize(data, country)
    @id = null
    @type = "recipe"
    @title = data[:recipe][:label]
    @url = data[:recipe][:uri]
    @country = country
    @image = data[:recipe][:image]
  end
end