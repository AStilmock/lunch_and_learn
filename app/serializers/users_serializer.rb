class UserSerializer
  include JSONAPI::Serializer
  attributes :name, :email, :password, :api_key
end