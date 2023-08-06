class RecipeSerializer
  include JSONAPI::Serializer
  attributes :id, :title, :url, :country, :image
  
  # def :id
  #   nil
  # end
end