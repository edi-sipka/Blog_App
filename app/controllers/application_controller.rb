class ApplicationController < ActionController::Base
  include Pagy::Backend
  def current_user
    User.first
  end
end
