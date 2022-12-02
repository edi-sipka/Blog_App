class ApplicationController < ActionController::Base
  include Pagy::Backend

  before_action :current_user

  def current_user
    Current.user = User.first
  end
end
