class LikesController < ApplicationController
  def new
    @like = Like.new
  end

  def create
    @post = Post.find(params[:post_id])
    @like = @post.likes.new(author_id: Current.user.id, post_id: @post.id)

    if @like.save
      redirect_to "/users/#{@post.author.id}/posts/#{@post.id}"
    else
      render :new
    end
  end
end
