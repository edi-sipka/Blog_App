class PostsController < ApplicationController
  def index; end

  def show
    params[:id]
  end
end
