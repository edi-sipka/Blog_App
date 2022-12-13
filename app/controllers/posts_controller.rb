class PostsController < ApplicationController
 

  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts.includes(:comments), items: 2)
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

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
