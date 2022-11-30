class AddDefaultValueToCounters < ActiveRecord::Migration[7.0]

  def self.up
  change_column :users, :posts_counter, :integer, default: 0 
  change_column :posts, :likes_counter, :integer, default: 0 
  change_column :posts, :comments_counter, :integer, default: 0 
  end

  def self.down
  change_column :users, :posts_counter, :integer, default: nil
  change_column :posts, :likes_counter, :integer, default: nil
  change_column :posts, :comments_counter, :integer, default: nil
    
  end
end
