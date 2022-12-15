class PostsController < ApplicationController
 load_and_authorize_resource

  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts, items: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @comments = @posts.comments.includes(:author)
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = current_user.id
    if @post.save
      redirect_to "/users/#{current_user.id}/posts"
    else
      render :new
    end
  end

  def destroy
    @post = Post.find(params[:id])
    @post.comments.destroy_all
    @post.likes.destroy_all
    @post.destroy

    if @post.destroy
      @post.update_posts_counter
      redirect_to user_posts_path(current_user.id)
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
