class UpdateCommentsUsersReference < ActiveRecord::Migration[7.0]
  def change
    remove_reference :comments, :user
    add_reference :comments, :author, foreign_key:{ to_table: :users}
  end
end
