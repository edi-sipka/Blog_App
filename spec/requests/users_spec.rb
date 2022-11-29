require 'rails_helper'

Rspec.describe 'Users', type: :request do
  describe 'GET/index' do
    it 'Returns http success message and view' do
      get '/'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('List of all users')
    end
  end

  describe 'GET/show' do
    it 'Returns http success message and view' do
      get '/users/:id'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('List of users by id')
    end
  end
end
