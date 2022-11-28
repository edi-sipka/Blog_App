class UsersController < ApplicationController
  def index; end

  def show
    params[:user_id]
  end
end
