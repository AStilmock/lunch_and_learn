# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


@user = User.create!(name: "email2", email: "email2@email.com", password: "password", api_key: "apikey1234567890")
@fav1 = @user.favorites.create!(country: "france", recipe_link: "http://www.edamam.com/ontologies/edamam.owl#recipe_48df011ddfee5cd4dacff1463e8701b0", recipe_title: "Herb And White Wine Granita")
@fav2 = @user.favorites.create!(country: "france", recipe_link: "http://www.edamam.com/ontologies/edamam.owl#recipe_0d543f253608386e21a3c9a62a4e43e7", recipe_title: "Savory Sesame Cookies")
@fav3 = @user.favorites.create!(country: "france", recipe_link: "http://www.edamam.com/ontologies/edamam.owl#recipe_8f9e0a801e673792608e1a8b08b587d9", recipe_title: "France Meets Italy Panini")