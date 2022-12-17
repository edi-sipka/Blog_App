require 'swagger_helper'

RSpec.describe 'Comments API', type: :request do
  path '/api/v1/comments' do
    post 'Creates a comment' do
      tags 'Comments'
      consumes 'application/json'
      parameter name: :comment, in: :body, schema: {
        type: :object,
        properties: {
          comment: { type: :string },
          user_id: { type: :integer },
          post_id: { type: :integer }
        },
        required: [ 'comment', 'user_id', 'post_id' ]
      }

      response '201', 'comment created' do
        let(:comment) { { comment: 'Comment', user_id: 1, post_id: 1 } }
        run_test!
      end

      response '422', 'invalid request' do
        let(:comment) { { comment: 'Comment', user_id: 1, post_id: 1 } }
        run_test!
      end
    end
  end

  path '/api/v1/comments/{id}' do
    get 'Retrieves a comment' do
      tags 'Comments'
      produces 'application/json'
      parameter name: :id, :in => :path, :type => :string

      response '200', 'comment found' do
        schema type: :object,
          properties: {
            id: { type: :integer },
            comment: { type: :string },
            user_id: { type: :integer },
            post_id: { type: :integer },
            created_at: { type: :string },
            updated_at: { type: :string }
          },
          required: [ 'id', 'comment', 'user_id', 'post_id', 'created_at', 'updated_at' ]

        let(:id) { Comment.create(comment: 'Comment', user_id: 1, post_id: 1).id }
        run_test!
      end

      response '404', 'comment not found' do
        let(:id) { 'invalid' }
        run_test!
      end

      response '406', 'unsupported accept header' do
        let(:'Accept') { 'application/foo' }
        run_test!
      end
    end
  end
end