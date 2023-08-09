class Favorite < ApplicationRecord
  belongs_to :user
  validates_presence_of :country, :recipe_link, :recipe_title

  def self.user_favorites(user)
    where(user_id: user.id)
  end
end