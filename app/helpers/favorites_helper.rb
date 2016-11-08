module FavoritesHelper
  def list_favorites
    current_user.favorites
  end
end
