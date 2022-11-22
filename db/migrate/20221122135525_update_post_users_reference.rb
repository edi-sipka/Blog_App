class UpdatePostUsersReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :posts, :user
    add_reference :posts, :author, foreign_key:{ to_table: :users}
  end
end
