class AddRoleColumnToUsers < ActiveRecord::Migration[7.0]
  def self.up
    add_column :users, :role, :string
  end
  def self.down
    remove_column :users, :role, :string
  end
end
