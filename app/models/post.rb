class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'

  def update_post_counter
    author.increment!(:posts_counter)
  end

  def recent_comments
    Comment.order(created_at: :desc).includes(:post).limit(5)
  end
end
