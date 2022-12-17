class Api::CommentsController < ApplicationController
  include Response
  include ExceptionHandler

  def index
    post = Post.find(params[:post_id])
    comments = post.comments.includes(:author)
    render json: comments
  end

  def create
    current_post = Post.find(params[:post_id])
    comments = current_post.comments.new(comment_params)
    comments.post_id = current_post.id
    comments.author_id = current_user.id

    if comments.save
      render json: comments, status: :created
    else
      render json: comments.errors, status: :unprocessable_entity
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
