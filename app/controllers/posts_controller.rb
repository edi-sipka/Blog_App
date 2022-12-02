class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts, items: 2)
  end

  def show
    @user = User.find(params[:user_id])
    @posts = Post.find(params[:id])
    @comments = @posts.comments
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.author_id = Current.user.id
    if @post.save
      redirect_to "/users/#{Current.user.id}/posts"
    else
      render :new
    end
  end

  private

  def post_params
    params.require(:post).permit(:title, :text)
  end
end
