class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'
  load_and_authorize_resource

  after_save :update_comments_counter

  def update_comment_counter
    post.decrement!(:comments_counter)
  end

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
