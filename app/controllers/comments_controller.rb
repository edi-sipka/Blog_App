class CommentsController < ApplicationController
  load_and_authorize_resource

  def new
    @comments = Comment.new
  end

  def create
    @current_post = Post.find(params[:post_id])
    @comments = @current_post.comments.new(comment_params)
    @comments.post_id = @current_post.id
    @comments.author_id = current_user.id

    if @comments.save
      redirect_to "/users/#{@current_post.author_id}/posts/#{@current_post.id}"
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:post_id])
    @comments = @post.comments.find(params[:id])
    @comments.destroy

    if @comments.destroy
      @comments.update_comment_counter
      redirect_to user_post_path(@post.author_id, @post.id)
    else
      render :new
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
