class CreateFriendships < ActiveRecord::Migration
  def change
    create_table :friendships do |t|
      t.integer :user_id, null: false
      t.integer :friend_id, null: false
      
      t.timestamps null: false
    end
    
    add_index :Friendships, :user_id
    add_index :Friendships, :friend_id
  end
end
