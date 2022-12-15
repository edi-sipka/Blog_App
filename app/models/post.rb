class Post < ApplicationRecord
  has_many :comments, foreign_key: 'post_id'
  has_many :likes, foreign_key: 'post_id'
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  after_save :update_post_counter
  load_and_authorize_resource

  validates :title, presence: true, length: { maximum: 250 }
  validates :comments_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }
  validates :likes_counter, comparison: { greater_than_or_equal_to: 0 }, numericality: { only_integer: true }

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end

  def update_posts_counter
    author.decrement!(:posts_counter)
  end

  after_save :update_post_counter

  private

  def update_post_counter
    author.increment!(:posts_counter)
  end
end


