class Api::PostsController < ApplicationController
    include Response
    include ExceptionHandler
    
  def index
    user = User.find(params[:user_id])
    posts = user.posts
    render json: posts
  end
end
