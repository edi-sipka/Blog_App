require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET/index' do
    it 'Returns http success message and view' do
      get '/users/:user_id/posts'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('List of all posts by given user')
    end
  end

  describe 'GET/show' do
    it 'Returns http success message and view' do
      get '/users/:user_id/posts/:id'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('List of specific post of specific user')
    end
  end
end
