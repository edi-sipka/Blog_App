class PostsController < ApplicationController
  def index
    @user = User.find(params[:user_id])
    @pagy, @posts = pagy(@user.posts,  items: 2)
  end

  def show
  end 
end
