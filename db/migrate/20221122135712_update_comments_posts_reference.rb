class UpdateCommentsPostsReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :post
    add_reference :comments, :post, foreign_key:{ to_table: :posts}
  end
end
