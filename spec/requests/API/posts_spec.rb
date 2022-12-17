require 'swagger_helper'

RSpec.describe 'Posts API', type: :request do
  path '/api/v1/posts' do
    post 'Creates a post' do
      tags 'Posts'
      consumes 'application/json'
      parameter name: :post, in: :body, schema: {
        type: :object,
        properties: {
          title: { type: :string },
          content: { type: :string },
          user_id: { type: :integer }
        },
        required: %w[title content user_id]
      }

      response '201', 'post created' do
        let(:post) { { title: 'Post', content: 'Content', user_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:post) { { title: 'Post', content: 'Content', user_id: 1 } }
        run_test!
      end
    end
  end

  path '/api/v1/posts/{id}' do
    get 'Retrieves a post' do
      tags 'Posts'
      produces 'application/json'
      parameter name: :id, in: :path, type: :string

      response '200', 'post found' do
        schema type: :object,
               properties: {
                 id: { type: :integer },
                 title: { type: :string },
                 content: { type: :string },
                 user_id: { type: :integer },
                 created_at: { type: :string },
                 updated_at: { type: :string }
               },
               required: %w[id title content user_id created_at updated_at]

        let(:id) { Post.create(title: 'Post', content: 'Content', user_id: 1).id }
        run_test!
      end

      response '404', 'post not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:Accept) { 'application/foo' }
        run_test!
      end
    end
  end
end
