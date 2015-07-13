class PostsController < ApplicationController
  def index
  	page = params[:page] || 1
  	@posts = Post.where("hidden = 0")
  								.order('id DESC')
                  .limit(21)
                  .offset((page.to_i - 1) * 20)
    # @next_post = @posts[20]
    # @posts = @posts.first(20)

  end

  def new
  end

  def edit
  end
end
