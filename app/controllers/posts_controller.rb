class PostsController < ApplicationController
  def index
    bad_word = 710
    @posts = Post.all
    @posts.each do |item|
      if bad_word % 5 == 0
        item.title = "SPAM"
        item.save
        bad_word += 1
      else
        bad_word += 1
      end
    end
  end

  def show
  end

  def new
  end

  def edit
  end

end
