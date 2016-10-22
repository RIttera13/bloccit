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
    @post = Post.find(params[:id])
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new
    @post.title = params[:post][:title]
    @post.body = params[:post][:body]

    if @post.save
      flash[:notice] = "Post was saved."
      redirect_to @post
    else
      flash.now[:alert] = "There was an error saving the post. Please try again."
      render :new
    end
  end

  def edit
  end

end
