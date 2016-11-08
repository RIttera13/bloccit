module UsersHelper
    def has_post?(user)
      @user.posts.count > 0
    end

    def has_comment?(user)
      @user.comments.count > 0
    end

    def has_favorites?(user)
      @user.favorites.count > 0
    end
end
