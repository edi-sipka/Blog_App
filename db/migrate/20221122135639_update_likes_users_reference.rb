class UpdateLikesUsersReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :likes, :user
    add_reference :likes, :author, foreign_key:{ to_table: :users}
  end
end
