class AddApiKeytoFavorites < ActiveRecord::Migration[7.0]
  def change
    add_column :favorites, :api_key, :string
  end
end
