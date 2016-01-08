class CreateFriendRequests < ActiveRecord::Migration
  def change
    create_table :friend_requests do |t|
      t.integer :user_id, null: false   
      t.integer :respondee_id , null: false
      t.boolean :accepted, default: false
      t.boolean :received, default: false
      
      t.timestamps null: false
    end
    
    add_index :friend_requests, :user_id
    add_index :friend_requests, :respondee_id
  end
end
