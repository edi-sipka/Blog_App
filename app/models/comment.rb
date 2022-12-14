class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :post, class_name: 'Post', foreign_key: 'post_id'

  after_save :update_comments_counter
  after_destroy :update_comments_counter

  def update_comment_counter
    comment.decrement!(:comments_counter)
  end

  private

  def update_comments_counter
    post.increment!(:comments_counter)
  end
end
