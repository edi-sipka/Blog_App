class UpdateLikesPostsReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :post
    add_reference :likes, :post, foreign_key:{ to_table: :posts}
  end
end
